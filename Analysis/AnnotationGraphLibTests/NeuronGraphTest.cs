﻿using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using AnnotationUtils;

namespace AnnotationUtilsTests
{
    [TestClass]
    public class NeuronGraphTest
    {
        public string Endpoint = "https://connectomes.utah.edu/Services/RabbitBinary/Annotate.svc";
        private System.Net.NetworkCredential userCredentials;

        public NeuronGraphTest()
        {
            userCredentials = new System.Net.NetworkCredential("jamesan", "4%w%o06");
        }

        [TestMethod]
        public void GenerateNeuronGraph()
        {
           
            AnnotationUtils.NeuronGraph graph = NeuronGraph.BuildGraph(new long[] {180}, 2, this.Endpoint, this.userCredentials);

            System.Diagnostics.Debug.Assert(graph != null);

            string JSONPath = "C:\\Temp\\Neuron476.json";

            NeuronJSONView JSONView = NeuronJSONView.ToJSON(graph);
            string JSON = JSONView.ToString(); 
            JSONView.SaveJSON(JSONPath); 

            NeuronDOTView dotGraph = AnnotationUtils.NeuronDOTView.ToDOT(graph);

            string dotPath = "C:\\Temp\\Neuron476.dot";
            dotGraph.SaveDOT(dotPath);

            string[] Types = new string[] {"svg"};

            //NeuronDOTView.Convert("dot", dotPath, Types);
             
        }
    }
}
