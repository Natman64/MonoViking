﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Viking.Common;
using Viking;
using System.Net;
using System.Diagnostics;
using System.IO;
using System.Xml.Linq;
using Viking.ViewModels; 

namespace MeasurementExtension
{
    public class Global : IInitExtensions
    {
        internal static double _UnitsPerPixel = 1;
        public static double UnitsPerPixel
        {
            get { return _UnitsPerPixel; }
        }

        internal static string _UnitOfMeasure = "Scale not specified";
        public static string UnitOfMeasure
        {
            get { return _UnitOfMeasure; }
        }
        
        #region IInitExtensions Members

        /// <summary>
        /// Returns true if the extension should be loaded
        /// </summary>
        /// <returns></returns>
        bool IInitExtensions.Initialize()
        {
            //This code will fetch the scale of the images from the webserver
            //If the scale can't be found we won't
            VolumeViewModel volume = Viking.UI.State.volume;

            if (volume == null)
                return false;
            
            if(GetScaleFromXML(volume.VolumeXML))
                return true;

            //See if we can load the about.xml file, this is for legacy support and can be removed after VikinkXML files have been regenerated with latest
            //CreateXML updates from 11/1/10

            Uri MappingURI = new Uri(volume.Host + "/About.xml");
            HttpWebRequest request = WebRequest.Create(MappingURI) as HttpWebRequest;

            //Attach credentials if using security
            if (MappingURI.Scheme.ToLower() == "https")
                request.Credentials = Viking.UI.State.UserCredentials;

            WebResponse response = null;
            try
            {
                response = request.GetResponse();
            }
            catch (WebException )
            {
                Trace.WriteLine("Could not locate WebAnnotationMapping.XML, disabling WebAnnotations.", "Measurement");
                if (response != null)
                    response.Close();

                return true;
            }

            //Convert the response into an XML document we can parse
            Stream responseStream = response.GetResponseStream();
            StreamReader XMLStream = new StreamReader(responseStream);
            XDocument XMLMapping = XDocument.Parse(XMLStream.ReadToEnd());

            //We are done with HTTP and the stream, so free those resources
            XMLStream.Close();
            responseStream.Close();
            response.Close();

            //See if we can locate a scale tag
            GetScaleFromXML(XMLMapping); 
            
            //Even if we couldn't load the default values, the user can set them.  Go ahead and load up.
            //If this module could not function we should return false which would tell Viking to unload it
            return true; 

        }

        private bool GetScaleFromXML(XDocument XMLMapping)
        {

            //Examine the XML document and determine the scale
            IEnumerable<XElement> VolumeElements = XMLMapping.Elements().Where(elem => elem.Name.LocalName == "Volume");

            foreach (XElement elem in VolumeElements)
            {
                //Fetch the name if we know it
                switch (elem.Name.LocalName)
                {
                    case "Volume":
                        IEnumerable<XElement> MappingElements = elem.Elements().Where(e => e.Name.LocalName == "Scale");

                        if (MappingElements.Count() == 0)
                            break;

                        XElement MappingElement = MappingElements.First();

                        XAttribute EndpointAttribute = MappingElement.Attribute("UnitsPerPixel");
                        if (EndpointAttribute == null)
                            break;

                        Global._UnitsPerPixel = System.Convert.ToDouble(EndpointAttribute.Value);

                        EndpointAttribute = MappingElement.Attribute("UnitsOfMeasure");
                        if (EndpointAttribute == null)
                            break;

                        Global._UnitOfMeasure = EndpointAttribute.Value;

                        return true; 

                    default:
                        break;
                }
            }

            //Even if we couldn't load the default values, the user can set them.  Go ahead and load up.
            //If this module could not function we should return false which would tell Viking to unload it
            return false;
        }
        

        #endregion 
    }
}

