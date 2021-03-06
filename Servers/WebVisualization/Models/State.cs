﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using ConnectomeViz.AnnotationService;


namespace ConnectomeViz.Models
{
    public static class State
    {
        public static NetworkCredential userCredentials = new NetworkCredential("anonymous", "connectome");

        public static string selectedService = "Rabbit(MarcLab)";

        public static string selectedLab = "MarcLab(connectomes.utah.edu)";
            
        public static string filesPath;

        public static string globalPath;

        public static string VikingPlotFileName = "VikingPlot3D.xml";

        public static string Structure3DFileName = "Structure3D.xml";

        public static string className = "VikingPlot";

        public static Boolean circuitFreshQuery = true;

        public static int circuitID;

        public static bool redirected = false;

        public static string redirectedQuery = "";

        public static int loginAttempts = 0;

        public static Dictionary<string, string> serviceDictionary = new Dictionary<string, string>()
        {
            {"Rabbit(MarcLab)","https://connectomes.utah.edu/Services/RabbitBinary/Annotate.svc"},
            
        };

        public static Dictionary<string, string[]> labsDictionary = new Dictionary<string, string[]>()
        {
            {"MarcLab(connectomes.utah.edu)", new string[] {"Rabbit(MarcLab)"}}
        };

        public static Dictionary<string, string> databaseDictionary = new Dictionary<string, string>()
        {
            {"Rabbit(MarcLab)", "Rabbit"}
        };

        public static Dictionary<string, string> serverDictionary = new Dictionary<string, string>()
        {
            {"MarcLab(connectomes.utah.edu)", "155.100.105.9"}
        };



        public static void ReadServices()
        {
            LoadServices.Initialize();
        }
        
     
        public static AnnotateStructuresClient CreateStructureClient()
        {
            AnnotateStructuresClient proxy = new AnnotateStructuresClient();
            proxy.Endpoint.Address = new System.ServiceModel.EndpointAddress(State.serviceDictionary[State.selectedService]);
            proxy.ClientCredentials.UserName.UserName = userCredentials.UserName;
            proxy.ClientCredentials.UserName.Password = userCredentials.Password;
        //    if (proxy.State != System.ServiceModel.CommunicationState.Opened)
        //        proxy.Open();

            return proxy;
        }

        public static AnnotateStructureTypesClient CreateStructureTypeClient()
        {
            AnnotateStructureTypesClient proxy = new AnnotateStructureTypesClient();
            proxy.Endpoint.Address = new System.ServiceModel.EndpointAddress(State.serviceDictionary[State.selectedService]);
            proxy.ClientCredentials.UserName.UserName = userCredentials.UserName;
            proxy.ClientCredentials.UserName.Password = userCredentials.Password;
        //    if(proxy.State != System.ServiceModel.CommunicationState.Opened)
        //        proxy.Open();

            return proxy;
        }

        public static AnnotateLocationsClient CreateLocationsClient()
        {
            AnnotateLocationsClient proxy = new AnnotateLocationsClient();
            proxy.Endpoint.Address = new System.ServiceModel.EndpointAddress(State.serviceDictionary[State.selectedService]);
            proxy.ClientCredentials.UserName.UserName = userCredentials.UserName;
            proxy.ClientCredentials.UserName.Password = userCredentials.Password;
       //     if (proxy.State != System.ServiceModel.CommunicationState.Opened)
       //         proxy.Open();

            return proxy;
        }

        public static CircuitClient CreateCircuitClient()
        {

            CircuitClient proxy = new CircuitClient();
            proxy.Endpoint.Address = new System.ServiceModel.EndpointAddress(State.serviceDictionary[State.selectedService]);
            proxy.ClientCredentials.UserName.UserName = userCredentials.UserName;
            proxy.ClientCredentials.UserName.Password = userCredentials.Password;
       //     if (proxy.State != System.ServiceModel.CommunicationState.Opened)
       //         proxy.Open();

            return proxy;
        }
        
        public static string[] stringLong;
        public static String userFile;
        public static String userFileName;
        public static String userURL;
       
        public static String virtualRoot;

        public static Dictionary<long, long> longLong = new Dictionary<long, long>();

        public static string graphType = "generate";

        public static System.Diagnostics.Process svgProcessReference;

        
        static State()
        {
            ServicePointManager.ServerCertificateValidationCallback += RemoteCertificateValidate;
        }

        /// <summary>
        /// Remotes the certificate validate.
        /// </summary>
        private static bool RemoteCertificateValidate(
           object sender, System.Security.Cryptography.X509Certificates.X509Certificate cert,
            System.Security.Cryptography.X509Certificates.X509Chain chain, System.Net.Security.SslPolicyErrors error)
        {
            // trust any certificate!!!
            System.Console.WriteLine("Warning, trust any certificate");
            return true;
        }

    }
}
