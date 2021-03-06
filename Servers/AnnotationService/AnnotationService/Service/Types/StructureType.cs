﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel;
using System.Runtime.Serialization;

namespace Annotation
{
    [DataContract]
    public class StructureType : DataObjectWithParent<long>
    {
        private string _Name;
        private string _Notes;
        private string _MarkupType;
        private string[] _Tags = new String[0];
        private string[] _StructureTags = new String[0]; 
        private bool _Abstract;
        private int _Color;
        private string _Code;
        private char _HotKey;

        [DataMember]
        public string Name
        {
            get { return _Name; }
            set { _Name = value; }
        }

        [DataMember]
        public string Notes
        {
            get { return _Notes; }
            set { _Notes = value; }
        }

        [DataMember]
        public string MarkupType
        {
            get { return _MarkupType; }
            set { _MarkupType = value; }
        }

        [DataMember]
        public string[] Tags
        {
            get { return _Tags; }
            set { _Tags = value; }
        }

        [DataMember]
        public string[] StructureTags
        {
            get { return _StructureTags; }
            set { _StructureTags = value; }
        }

        [DataMember]
        public bool Abstract
        {
            get { return _Abstract; }
            set { _Abstract = value; }
        }

        [DataMember]
        public int Color
        {
            get { return _Color; }
            set { _Color = value; }
        }

        [DataMember]
        public string Code
        {
            get { return _Code; }
            set { _Code = value; }
        }

        [DataMember]
        public char HotKey
        {
            get { return _HotKey; }
            set { _HotKey = value; }
        }

        public StructureType()
        {
     //       DBAction = DBACTION.INSERT; 
        }

        public StructureType(Annotation.Database.DBStructureType type)
        {
            _ID = type.ID;
            _ParentID = type.ParentID;
            _Name = type.Name.Trim();
            

            if(type.Notes != null)
                _Notes = type.Notes.TrimEnd();
            _MarkupType = type.MarkupType;

            if (type.Tags == null)
                _Tags = new string[0]; 
            else
                _Tags = type.Tags.Split(';');

            if (type.StructureTags == null)
                _StructureTags = new string[0]; 
            else
                _StructureTags = type.StructureTags.Split(';');

            _Abstract = type.Abstract;
            _Color = type.Color;
            _Code = type.Code;
            _HotKey = type.HotKey;
        }

        public void Sync(Annotation.Database.DBStructureType type)
        {
            
            type.ParentID = _ParentID;
            type.Name = _Name;
            type.Notes = _Notes;
            type.MarkupType = _MarkupType;
            

            string tags = ""; 
            foreach(string s in _Tags)
            {
                tags = s + ';'; 
            }

            type.Tags = tags;

            string structuretags = "";
            foreach(string s in _StructureTags)
            {
                tags = structuretags + ';'; 
            }

            type.StructureTags = structuretags; 
            type.Abstract = _Abstract; 
            type.Color = _Color;
            type.Code = _Code;
            type.HotKey = _HotKey;
            type.Username = ServiceModelUtil.GetUserForCall();
        }
    }
}
