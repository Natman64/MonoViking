﻿
namespace connectomes.utah.edu.XSD.WebAnnotationUserSettings.xsd
{
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.IO;
    using System.Diagnostics;
    using System.Xml;
    using System.Xml.Schema;
    using System.Xml.Linq;
    //using Xml.Schema.Linq;
    using System.Windows.Forms;


    public partial class Hotkey
    {
        public System.Windows.Forms.Keys KeyCode
        {
            get {
                    KeysConverter conv = new KeysConverter();
                    return (Keys)conv.ConvertFrom(this.KeyName);

//                    int keyCode = System.Convert.ToInt32(this.KeyName);
//                    return (System.Windows.Forms.Keys)keyCode;
            }
        } 
    }

    public partial class Parameters
    {
        public int Count
        {
            get
            {
                return this.Action.Count +
                       this.Value.Count +
                       this.Variable.Count; 
            }
        }
    }

    public partial class Action
    {
        public void ExecuteAction(out System.Type type, out object[] parameters)
        {
            //Parse the parameters
            parameters = new object[this.Parameters.Count];
            foreach(Variable variable in this.Parameters.Variable)
            {
                System.Type targetType = System.Type.GetType(variable.Object);
                System.Reflection.PropertyInfo propInfo = targetType.GetProperty(variable.Property);
                //Doesn't work... not sure how to read the property...
            }

            foreach(Action action in this.Parameters.Action)
            {
                System.Type targetType;
                object[] actionParams;
                action.ExecuteAction(out targetType, out actionParams);
                parameters[action.Index.Value] = Activator.CreateInstance(targetType, actionParams); 
            }

            foreach (Value value in this.Parameters.Value)
            {
                Type targetType = System.Type.GetType(value.Type);
                parameters[value.Index] = System.Convert.ChangeType(value.Value1, targetType);
            }
            
            type = System.Type.GetType(this.Type);
            return; 
        }
    }





}