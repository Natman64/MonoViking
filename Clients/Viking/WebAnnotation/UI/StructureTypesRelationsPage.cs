﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Diagnostics;

using Viking.Common;

using WebAnnotationModel;

namespace WebAnnotation.UI
{
    [PropertyPage(typeof(StructureTypeObj), 2)]
    public partial class StructureTypesRelationsPage : Viking.UI.BaseClasses.PropertyPageBase
    {
        StructureTypeObj Obj = null;

        public StructureTypesRelationsPage()
        {
            this.Title = "Relations"; 
            InitializeComponent();
        }

        protected override void OnShowObject(object Object)
        {
            this.Obj = Object as StructureTypeObj;
            Debug.Assert(this.Obj != null);

            if (Obj.Parent != null)
                this.linkParent.SourceObject = Obj.Parent as IUIObject;

            for (int iChild = 0; iChild < Obj.Children.Length; iChild++)
                this.listChildren.AddObject(Obj.Children[iChild] as IUIObject);
        }

        protected override void OnSaveChanges()
        {

            this.Obj.Parent = this.linkParent.SourceObject as StructureTypeObj;

        }
    }
}
