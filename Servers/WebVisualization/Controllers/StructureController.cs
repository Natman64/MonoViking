using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Text;
using System.IO;
using System.Diagnostics;
using ConnectomeViz.AnnotationService;
using ConnectomeViz.Models;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.ServiceModel;
using System.Runtime.Serialization.Formatters.Binary;



namespace ConnectomeViz.Controllers
{
    [Authorize]
    public class StructureController : Controller
    {
        //
        // GET: /Structure/

        public ActionResult Index()
        {

            string applicationPath = HttpContext.Request.ApplicationPath;
            if (applicationPath == "/")
                applicationPath = "";
            State.virtualRoot = "http://" + HttpContext.Request.Url.Authority + applicationPath;

            string workingDirectory = Server.MapPath("~");
            State.filesPath = workingDirectory;


            MembershipUser user = Membership.GetUser(HttpContext.User.Identity.Name);
            State.ReadServices();

            if (!user.IsApproved)
                return RedirectToAction("Index", "Default");
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Locations(string id)
        {
            
                return RedirectToAction("Index", "Structure");
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Locations()
        {
            int cellID;

            if (!String.IsNullOrEmpty(Request["ctl00$MainContent$structureID"]) && Int32.Parse(Request["ctl00$MainContent$structureID"]) != 0)
            {
                cellID = Convert.ToInt32(Request["ctl00$MainContent$structureID"]);
            }
            else
            {
                cellID = Convert.ToInt32(Request["cellID"]);
            }

            ViewData["cellID"] = cellID;

            State.selectedService = Request["ctl00$MainContent$dataSource"];

            State.selectedLab = Request["ctl00$MainContent$labName"];

            ViewData["dataSource"] = State.selectedService;

            //Map the virtual path of application
            string applicationPath = HttpContext.Request.ApplicationPath;
            if (applicationPath == "/")
                applicationPath = "";

            string workDirectory = Server.MapPath("~");
            ViewData["workDirectory"] = workDirectory;

            string virtualRoot = "http://" + HttpContext.Request.Url.Authority + applicationPath;
            ViewData["virtualRoot"] = virtualRoot;

            ViewData["structureid"] = cellID;



            Graph graph = new Graph();

            graph = computeGraph(cellID);

            graph.volumeToSurfaceRatio = Math.Round((graph.cellSurfaceArea / Math.Pow(10, 6)) / (graph.cellVolume / Math.Pow(10, 9)), 3);
            generateGraph(cellID, graph);

            ViewData["area"] = Math.Round(graph.cellSurfaceArea / Math.Pow(10, 6), 3);
            ViewData["volume"] = Math.Round(graph.cellVolume / Math.Pow(10, 9), 3);
            ViewData["ratio"] = graph.volumeToSurfaceRatio;

            // If 3D is requested, store structureID and return View
            if (Request["group2"] == "3D")
            {

                string fileDir = workDirectory + "\\Files\\" + HttpContext.User.Identity.Name;

                if (!System.IO.Directory.Exists(fileDir))
                    System.IO.Directory.CreateDirectory(fileDir);

                string filepath = fileDir + "\\Structure3D.xml";

                if (System.IO.File.Exists(filepath))
                {
                    System.IO.File.Delete(filepath);
                }

                using (FileStream fs = new FileStream(filepath, FileMode.Create, FileAccess.Write))
                {
                    using (StreamWriter sw = new StreamWriter(fs))
                    {
                        sw.Write("<Structure3D>");
                        sw.Write(State.selectedLab + "," + State.selectedService + "," + cellID);
                        sw.Write("</Structure3D>");
                        sw.Flush();
                    }
                }

                return View("Locations3D");
            }


            if (Request["group1"] == "generate")
            {
                return View("Locations");
            }
            else
            {
                Response.ClearHeaders();
                Response.ClearContent();
                Response.Clear();
                Response.AddHeader("content-disposition", "inline;filename=" + cellID + ".svg");
                Response.ContentType = "image/svg+xml";
                Response.WriteFile(workDirectory + "\\Files\\" + HttpContext.User.Identity.Name + "\\" + cellID + ".svg");
                Response.Flush();
                Response.End();

            }

            return View("Index");
        }

        public class NodeJSON
        {
            public long ID;
            public double[] location;
            public double radius;
            


            public NodeJSON()
            {
                location = new double[3];
            }

            
        }

        public class SynapseJSON
        {
            public long ID;
            public double[] location;
            public double radius;
            public string type;
            public string color;

            public SynapseJSON()
            {
                location = new double[3];
            }

            public void SetColor(int Color){

                string ColorString = Color.ToString("X");
                int iStart = ColorString.Length - 6;
                this.color = "0x" + ColorString.Substring(iStart>0?iStart:0,6);
            }
        }



        public class GraphJSON
        {
            public List<NodeJSON> Nodes;
            public List<Edge> Edges;
            public List<SynapseJSON> Synapses;

            public string defaultNodeColor = "0x99CC00"; 

            public GraphJSON()
            {
                Nodes = new List<NodeJSON>();
                Edges = new List<Edge>();
                Synapses = new List<SynapseJSON>();
            }

            public void SetDefaultColor(int Color)
            {
                this.defaultNodeColor = "0x" + Color.ToString();
            }
        }

        //public class SynapseObject
        //{
        //    public List<SynapseStats> objList;

        //    public SynapseObject()
        //    {
        //      objList  = new List<SynapseStats>();
        //    }


        //}
        //public class SynapseStats
        //{
        //    public long id;
        //    public string[] synapses;
        //}

        public ActionResult GetID()
        {
            int structureid = Convert.ToInt32(Request.Form["structureid"]);

            //Map the virtual path of application
            string applicationPath = HttpContext.Request.ApplicationPath;
            if (applicationPath == "/")
                applicationPath = "";

            string workDirectory = Server.MapPath("~");

            string virtualRoot = "http://" + HttpContext.Request.Url.Authority + applicationPath;

            string filepath = virtualRoot + "/Files/" + HttpContext.User.Identity.Name + "/" + "Structure3D.xml";

            return Content(filepath);

        }

        public ActionResult StatisticsJSON()
        {
            CircuitClient client = State.CreateCircuitClient();
            SynapseObject retObj = null; 

            try
            {
                client.Open();
                retObj = client.getSynapseStats();
            }
            finally
            {
                if(client != null)
                {
                    client.Close();       
                    client = null;
                }
            }
             

            return Json(retObj,JsonRequestBehavior.AllowGet);

        }

        public ActionResult StructuresJSON(string request)
        {
            var res = Request;

            string workingDirectory = Server.MapPath("~");
            State.filesPath = workingDirectory;              

            string[] query = request.Split(',');

            string dataSource = query[1];

            string labName = query[0];

            int id = Int32.Parse(query[2]);

            ConnectomeViz.Models.State.selectedLab = labName.ToString(); ;

            ConnectomeViz.Models.State.selectedService = dataSource.ToString();

            //comment from here
            //GraphJSON sendGraph = new GraphJSON();

            //Graph graph = computeGraph(id);
            //long factor = 15000;

            //foreach (KeyValuePair<long, Node> node in graph.Nodes)
            //{
            //    NodeJSON tempNode = new NodeJSON();
            //    tempNode.ID = node.Value.ID;
            //    tempNode.radius = node.Value.radius / factor;
            //    tempNode.location[0] = node.Value.position.X / factor;
            //    tempNode.location[1] = node.Value.position.Y / factor;
            //    tempNode.location[2] = node.Value.position.Z / factor;
            //    sendGraph.Nodes.Add(tempNode);
            //}

            //sendGraph.Edges = graph.Edges;

            //sendGraph.Synapses = graph.Synapses;

            string localDir = Server.MapPath("~") + "\\Files\\" + HttpContext.User.Identity.Name + "\\";
            string fileDir = localDir + id;
            GraphJSON sendGraph;
            using (FileStream fs = new FileStream(fileDir + ".json", FileMode.Open, FileAccess.Read))
            {
                using (StreamReader sr = new StreamReader(fs))
                {
                    string obj = sr.ReadToEnd().ToString();
                    JavaScriptSerializer deserialize = new JavaScriptSerializer();
                    sendGraph = (GraphJSON)deserialize.Deserialize<GraphJSON>(obj);
                }
            }

            return Json(sendGraph, JsonRequestBehavior.AllowGet);
        }


        public Graph computeGraph(long structureid)
        {


            Graph graph = new Graph();

            List<long> LocationIds = new List<long>();
            LocationIds.Add(structureid);

            Structure structure = null;
            Location[] results = new Location[0];
            using (AnnotateStructuresClient proxyStructures = State.CreateStructureClient())
            {

                structure = proxyStructures.GetStructureByID(structureid, false);

                using (AnnotateLocationsClient proxyLocations = State.CreateLocationsClient())
                {

                    results = proxyLocations.GetLocationsForStructure(structureid);
                }

                proxyStructures.Close(); 
            }

            using (AnnotateStructureTypesClient proxyStructureType = State.CreateStructureTypeClient())
            {

                StructureType type = proxyStructureType.GetStructureTypeByID(structure.TypeID);
                if(type != null)
                    graph.DefaultNodeColor = type.Color;
                proxyStructureType.Close();

            }  

            foreach (Location location in results)
            {
                AnnotationPoint p = new AnnotationPoint();

                p.X = location.VolumePosition.X * 2.18;
                p.Y = location.VolumePosition.Y * 2.18;
                p.Z = location.VolumePosition.Z * 90;

                location.Radius *= 2.18;

                location.VolumePosition = p;

                Node node = new Node(location);

                graph.Nodes.Add(location.ID, node);
            }

            graph.originalNodes = new Dictionary<long, Node>(graph.Nodes);

            graph.createEdges();

            graph.generateStats(Convert.ToInt32(structureid));

            //FileStream temp = new FileStream("E:\\src\\info.txt", FileMode.OpenOrCreate, FileAccess.ReadWrite);
            //StreamWriter wr = new StreamWriter(temp);
            //wr.WriteLine(proxy.State);
            //wr.Close(); temp.Close();

            graph.reduceEdges();

            graph.createEdgeList();

            graph.createSynapses(Convert.ToInt32(structureid));
             

            return graph;

        }

        public void generateGraph(long structureid, Graph graph)
        {
            GraphVizEngine structuresGraph = new GraphVizEngine();

            structuresGraph.createUndirectedGraph(structureid.ToString());

            long factor = 15000;


            //FileStream fs = new FileStream(workDirectory+"\\Files\\"+structureid+".dot", FileMode.Create, FileAccess.Write);
            //StreamWriter sw = new StreamWriter(fs);
            //sw.Write("graph " + structureid + "{\n");
            //StringBuilder level = new StringBuilder();
            double maxX = 0.0, maxZ = 0.0;
            foreach (KeyValuePair<long, Node> node in graph.Nodes)
            {
                if (maxX < node.Value.position.X)
                    maxX = node.Value.position.X;
                if (maxZ < node.Value.position.Z)
                    maxZ = node.Value.position.Z;

            }

            Console.WriteLine("MaxX =" + maxX);
            Console.WriteLine("MaxZ =" + maxZ);

            structuresGraph.graphAttribites.Add("size", Convert.ToInt32(maxZ / (300 * 5)) + "," + Convert.ToInt32(maxX / (300 * 5)) + "!");

            // sw.Write("graph[size=\"" + Convert.ToInt32(maxZ / (300 * 5)) + "," + Convert.ToInt32(maxX / (300 * 5)) + "!\"];\n");
            // sw.Write("edge[decorate=false];\n");
            // sw.Write("node[fontcolor=white]\n;");
            string color = "green";
            foreach (KeyValuePair<long, Node> node in graph.Nodes)
            {
                Nodes tmpNode = structuresGraph.addNode(node.Value.ID);
                int radii = Convert.ToInt32(Math.Ceiling(node.Value.radius / (300)));
      
                tmpNode.nodeAttributes.Add("style", "filled");
                tmpNode.nodeAttributes.Add("penwidth", "9.0");
                tmpNode.nodeAttributes.Add("fillcolor", color);
                tmpNode.nodeAttributes.Add("pos", (Convert.ToInt32(Math.Ceiling(node.Value.position.X / 300)) + "," + Convert.ToInt32((maxZ - node.Value.position.Z) / 300) +
                    "!").ToString());
                tmpNode.nodeAttributes.Add("shape", "box");
                tmpNode.nodeAttributes.Add("width", radii.ToString());
                tmpNode.nodeAttributes.Add("height", (radii / 4).ToString());
                tmpNode.nodeAttributes.Add("tooltip", node.Value.ID.ToString());
                tmpNode.nodeAttributes.Add("URL", "#");


                //sw.Write(node.Value.ID + "[label=\"" + node.Value.ID + "\",style=filled,penwidth=\"9.0\",color=black,fillcolor=" + color + ",pos=\"" + Convert.ToInt32(Math.Ceiling(node.Value.position.X / 300)) + "," + Convert.ToInt32((maxZ - node.Value.position.Z) / 300) +
                //    "!\",shape=circle,width=\"" + radii + "\",href=\"http://www.google.com\"];\n");
                
            }

         
            List<string> edgeList = new List<string>();


            foreach (Edge edge in graph.Edges)
            {
                Edges tmpEdge = new Edges();
                structuresGraph.addEdge(tmpEdge);
                tmpEdge.from = edge.A;
                tmpEdge.to = edge.B;
                tmpEdge.edgeAttributes.Add("label", Math.Round(edge.distance, 2).ToString() + "nm");
                tmpEdge.edgeAttributes.Add("style", "setlinewidth(5)");
                tmpEdge.edgeAttributes.Add("href", "#");
                tmpEdge.edgeAttributes.Add("fontsize", "30");

                //sw.Write(edge.A + "--" + edge.B + "[label = \"" + Math.Round(edge.distance, 2) + "nm\",style=\"setlinewidth(5)\",href=\".\",fontsize=30];\n");

            }


            string workingDirectory = Server.MapPath("~");
            ViewData["workDirectory"] = workingDirectory;

            string localDir = ViewData["workDirectory"] + "\\Files\\" + HttpContext.User.Identity.Name + "\\";
            string fileDir = localDir + structureid;
            structuresGraph.completePath_local = fileDir;
            ViewData["username"] = HttpContext.User.Identity.Name;

            string svgfile = fileDir + ".svg";
            string virtualRoot = ViewData["virtualRoot"].ToString();

            structuresGraph.completePath_URL = virtualRoot + "/Files/" + HttpContext.User.Identity.Name +"/" + structureid;

            structuresGraph.virtualRoot = virtualRoot;

            if (!System.IO.Directory.Exists(localDir))
                System.IO.Directory.CreateDirectory(localDir);

           

            GraphJSON sendGraph = new GraphJSON();
            
            foreach (KeyValuePair<long, Node> node in graph.Nodes)
            {
                NodeJSON tempNode = new NodeJSON();
                tempNode.ID = node.Value.ID;
                tempNode.radius = node.Value.radius / factor;
                tempNode.location[0] = node.Value.position.X / factor;
                tempNode.location[1] = node.Value.position.Y / factor;
                tempNode.location[2] = node.Value.position.Z / factor;
                sendGraph.Nodes.Add(tempNode);
            }

            sendGraph.Edges = graph.Edges;

            sendGraph.Synapses = graph.Synapses;


            using (FileStream fs = new FileStream(fileDir + ".json", FileMode.Create, FileAccess.Write))
            {
                using (StreamWriter sw = new StreamWriter(fs))
                {
                    JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                    sw.Write(oSerializer.Serialize(sendGraph));
                    sw.Close();
                }
                fs.Close();
            }

            structuresGraph.outputFormats.Add("svg");

            structuresGraph.layout = "dot";

            structuresGraph.Output();

            //Add scripts to svg
            if (System.IO.File.Exists(svgfile))
            {
                StringBuilder contents;
                using (FileStream file = new FileStream(svgfile, FileMode.OpenOrCreate, FileAccess.ReadWrite))
                {
                    using (StreamReader sr = new StreamReader(file))
                    {
                        contents = new StringBuilder(sr.ReadToEnd());
                    }
                }

                System.IO.File.Delete(svgfile);


                string searchfor = "http://www.w3.org/1999/xlink\">";
                contents.Replace(searchfor, searchfor +
                    "\n<script xlink:href=\"" + virtualRoot + "/Scripts/SVGzoom.js\"/>\n<script xlink:href=\"" + virtualRoot + "/Scripts/effect.js\"/>");

                using (FileStream fl = new FileStream(svgfile, FileMode.Create))
                {
                    using (StreamWriter write = new StreamWriter(fl))
                    {
                        write.Write(contents.ToString());
                    }
                }

                //FileStream f2 = new FileStream(fileDir + "changed.txt", FileMode.Create);
                //StreamWriter wrr = new StreamWriter(f2);
                //wrr.Write(contents.ToString());
                //wrr.Close();
                //f2.Close();
            }

        }


        public class Edge
        {
            public long A
            { get; set; }

            public long B
            { get; set; }

            public double distance
            { get; set; }
        }

        public class Node
        {
            public SortedDictionary<long, double> Edges = new SortedDictionary<long, double>();
            public long ID;
            public AnnotationPoint position = new AnnotationPoint();
            public double radius;
            public List<long> links = new List<long>();


            public Node(Location location)
            {
                this.ID = location.ID;

                this.position = location.VolumePosition;

                this.radius = location.Radius;

                if (location.Links == null)
                    this.links = new List<long>();
                else
                    this.links = location.Links.ToList();
            }

        }

        public class Graph // A graph containing node structures
        {
            public Dictionary<long, Node> Nodes = new Dictionary<long, Node>();

            public List<Edge> Edges = new List<Edge>();

            public Dictionary<long, Node> originalNodes;

            public List<SynapseJSON> Synapses = new List<SynapseJSON>();

            public double cellSurfaceArea;

            public double cellVolume;

            public double cellConvexHullArea;

            public double volumeToSurfaceRatio;

            public string[] synapseTypeCount;

            public int DefaultNodeColor; 

            public Graph()
            {
                cellSurfaceArea = 0.0;

                cellVolume = 0.0;

                cellConvexHullArea = 0.0;

                volumeToSurfaceRatio = 0;

            }
            public void createEdges()
            {
                foreach (KeyValuePair<long, Node> node in Nodes)
                {
                    long ID = node.Value.ID;

                    foreach (long link in node.Value.links)
                    {
                        try
                        {
                        AnnotationPoint linkPosition = Nodes[link].position;
                        double distance = Math.Sqrt(
                                          Math.Pow(node.Value.position.X - linkPosition.X, 2) +
                                          Math.Pow(node.Value.position.Y - linkPosition.Y, 2) +
                                          Math.Pow(node.Value.position.Z - linkPosition.Z, 2));
                            
                        
                        
                            node.Value.Edges.Add(link, distance);
                        }
                        catch { }


                    }


                }

            }

            public int countNodesWithNeighbours(int num)
            {
                int counter = 0;
                foreach (KeyValuePair<long, Node> node in Nodes)
                {
                    if (node.Value.Edges.Keys.Count() == num)
                        counter++;
                }
                return counter;
            }

            public void propagateDead(long nodeID)
            {

                foreach (KeyValuePair<long, Node> node in Nodes)
                {
                    if (node.Value.Edges.ContainsKey(nodeID))
                    {
                        node.Value.Edges.Remove(nodeID);
                        node.Value.links.Remove(nodeID);
                    }
                }

            }
            public void reduceEdges()
            {

                List<long> deadList = new List<long>();
                bool run = true;
                int reduced = 0;
                while (run)
                {
                    reduced = 0;

                    foreach (KeyValuePair<long, Node> node in Nodes)
                    {
                        if (node.Value.links.Count() == 2)
                        {
                            if (!this.Nodes.ContainsKey(node.Value.links[0]) ||
                               !this.Nodes.ContainsKey(node.Value.links[1]))
                                continue; 

                            Node firstNeighbour = this.Nodes[node.Value.links[0]];

                            Node secondNeighbour = this.Nodes[node.Value.links[1]];

                            double firstDistance = node.Value.Edges[node.Value.links[0]];

                            double secondDistance = node.Value.Edges[node.Value.links[1]];

                            this.propagateDead(node.Value.ID);

                            this.Nodes.Remove(node.Value.ID);

                            if (!this.Nodes[firstNeighbour.ID].Edges.ContainsKey(secondNeighbour.ID))
                            {
                                firstNeighbour.Edges.Add(secondNeighbour.ID, firstDistance + secondDistance);

                                firstNeighbour.links.Add(secondNeighbour.ID);

                                secondNeighbour.Edges.Add(firstNeighbour.ID, firstDistance + secondDistance);

                                secondNeighbour.links.Add(firstNeighbour.ID);

                            }

                            else
                            {

                                firstNeighbour.Edges[secondNeighbour.ID] += firstDistance + secondDistance;

                                secondNeighbour.Edges[firstNeighbour.ID] += firstDistance + secondDistance;
                            }


                            reduced++;

                            break;
                        }


                    }

                    if (reduced == 0)
                        run = false; 
                }

            }


            public void createEdgeList()
            {
                foreach (KeyValuePair<long, Node> node in Nodes)
                {
                    foreach (KeyValuePair<long, double> edge in node.Value.Edges)
                    {
                        Edge temp = new Edge();
                        temp.A = node.Value.ID;
                        temp.B = edge.Key;
                        temp.distance = edge.Value;
                        this.Edges.Add(temp);
                        this.Nodes[edge.Key].Edges.Remove(node.Value.ID);
                    }
                }
            }

            public void createSynapses(int structureID)
            {
                Structure mainStructure = null;
                Structure[] synapses = new Structure[0];
                using (AnnotateStructuresClient structureProxy = State.CreateStructureClient())
                {
                    structureProxy.Open();
                    mainStructure = structureProxy.GetStructureByID(structureID, true);
                    synapses = structureProxy.GetStructuresByIDs(mainStructure.ChildIDs, false); 

                    using (AnnotateStructureTypesClient structureTypeProxy = State.CreateStructureTypeClient())
                    {
                        structureTypeProxy.Open(); 

                        Dictionary<long, StructureType> dictStructType = new Dictionary<long, StructureType>();

                        long factor = 15000;

                        using(AnnotateLocationsClient locationsProxy = State.CreateLocationsClient())
                        {

                            foreach (Structure child in synapses)
                            {
                                SynapseJSON temp = new SynapseJSON();
                                temp.ID = child.ID;
                                double XYScale = 2.18;


                                Location[] locs = locationsProxy.GetLocationsForStructure(child.ID);
                                if (locs != null && locs.Length > 0)
                                {
                                    double meanX = 0;
                                    double meanY = 0;
                                    double meanZ = 0;
                                    double maxRadius = 0;
                                    foreach(Location loc in locs)
                                    {   
                                        meanX += loc.VolumePosition.X;
                                        meanY += loc.VolumePosition.Y;
                                        meanZ += loc.VolumePosition.Z;
                                        maxRadius = Math.Max(maxRadius, loc.Radius);
                                    }

                                    meanX /= locs.Length;
                                    meanY /= locs.Length;
                                    meanZ /= locs.Length;

                                    temp.radius = maxRadius * XYScale / factor;
                                    temp.location[0] = meanX * XYScale / factor;
                                    temp.location[1] = meanY * XYScale / factor;
                                    temp.location[2] = meanZ * 90 / factor;

                                    StructureType type = null;
                                    if (dictStructType.ContainsKey(child.TypeID) == false)
                                    {
                                        type = structureTypeProxy.GetStructureTypeByID(child.TypeID);
                                        dictStructType.Add(child.TypeID, type);
                                    }

                                    type = dictStructType[child.TypeID];

                                    temp.type = type.Name;

                                    //Figure out if the synapse is linked, if not, use a seperate color
                                    if (child.Links != null && child.Links.Length > 0)
                                        temp.SetColor(type.Color);
                                    else
                                    {
                                        System.Drawing.Color adjustedColor;
                                        if (type.Name.Contains("Post"))
                                        {
                                             adjustedColor = System.Drawing.Color.FromArgb(255, 96, 96, 96);
                                        }
                                        else
                                        {
                                             adjustedColor = System.Drawing.Color.FromArgb(255, 228, 228, 228);
                                        }
                                    
                                        //System.Drawing.Color adjustedColor = ConnectomeViz.Helpers.HSBColor.ColorFromAhsb(color.A, color.GetHue(), color.GetSaturation() / 2, color.GetBrightness());
                                    

                                        temp.SetColor(adjustedColor.ToArgb());
                                    }

                                    this.Synapses.Add(temp);
                                }
                            }

                            locationsProxy.Close();
                         }


                        structureTypeProxy.Close();
                    }

                    structureProxy.Close();
                }
            }

            public void generateStats(int structureid)
            {
                SortedDictionary<string, string> processedEdges = new SortedDictionary<string, string>();

                CircuitClient proxy = State.CreateCircuitClient();
              
                proxy.Open();

                this.synapseTypeCount = State.stringLong = proxy.getSynapses(structureid);
               
              

                proxy.Close();

                foreach (KeyValuePair<long, Node> node in originalNodes)
                {
                    foreach (KeyValuePair<long, double> edge in node.Value.Edges)
                    {
                        try
                        {
                            processedEdges[node.Value.ID + "-" + edge.Key] = "done";
                            processedEdges[edge.Key + "-" + node.Value.ID] = "done";

                            if (node.Value.Edges.Count() == 1)
                            {
                                double r = node.Value.radius;
                                if (node.Value.position.Z > originalNodes[edge.Key].position.Z)
                                    r = originalNodes[edge.Key].radius;
                                this.cellSurfaceArea += Math.PI * r * r;
                            }
                            this.cellSurfaceArea += frustumLSA(node.Value.radius, originalNodes[edge.Key].radius, edge.Value);
                            this.cellVolume += frustumVolume(node.Value.radius, originalNodes[edge.Key].radius, edge.Value);
                        }

                        catch (Exception e)
                        {

                        }
                    }
                }

            }

            public double frustumLSA(double R, double r, double h)
            {
                double result = Math.PI * (R + r) * Math.Sqrt(Math.Pow((R - r), 2) + h * h);

                return result;
            }

            public double frustumVolume(double R, double r, double h)
            {
                var result = (1 / 3.0) * Math.PI * h * (R * R + R * r + r * r);

                return result;
            }
        }
    }
}
