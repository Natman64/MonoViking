#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by LINQ to SQL template for T4 C#
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using System;
using System.ComponentModel;
using System.Data.Linq;
using System.Data.Linq.Mapping;


namespace Annotation.Database
{	
	[Table(Name=@"dbo.Location")]
	public partial class DBLocation : INotifyPropertyChanging, INotifyPropertyChanged
	{
		#region Property Change Event Handling
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		public event PropertyChangingEventHandler PropertyChanging;
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if (PropertyChanging != null) {
				PropertyChanging(this, emptyChangingEventArgs);
			}
		}
			
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if (PropertyChanged != null) {
				PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		#endregion
		
		#region Extensibility Method Definitions
		partial void OnLoaded();
		partial void OnValidate(ChangeAction action);
		partial void OnCreated();
		#endregion

		#region Construction
		public DBLocation()
		{
			_SourcedBy = new EntitySet<DBLocationLink>(attach_IsLinkedTo, detach_IsLinkedTo);
			_TargettedBy = new EntitySet<DBLocationLink>(attach_IsLinkedFrom, detach_IsLinkedFrom);
			_DBStructure = default(EntityRef<DBStructure>); 
			OnCreated();
		}
		#endregion

		#region Column Mappings
		partial void OnIDChanging(long value);
		partial void OnIDChanged();
		private long _ID;
		[Column(Storage=@"_ID", AutoSync=AutoSync.OnInsert, DbType=@"BigInt NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true, UpdateCheck=UpdateCheck.WhenChanged)]
		public long ID
		{
			get { return _ID; }
			set {
				if (_ID != value) {
					OnIDChanging(value);
					SendPropertyChanging();
					_ID = value;
					SendPropertyChanged("ID");
					OnIDChanged();
				}
			}
		}
		
		partial void OnParentIDChanging(long value);
		partial void OnParentIDChanged();
		private long _ParentID;
		[Column(Storage=@"_ParentID", DbType=@"BigInt", CanBeNull=false, UpdateCheck=UpdateCheck.WhenChanged)]
		public long ParentID
		{
			get { return _ParentID; }
			set {
				if (_ParentID != value) {
					if (_DBStructure.HasLoadedOrAssignedValue) {
						throw new ForeignKeyReferenceAlreadyHasValueException();
					}
					OnParentIDChanging(value);
					SendPropertyChanging();
					_ParentID = value;
					SendPropertyChanged("ParentID");
					OnParentIDChanged();
				}
			}
		}
		
		partial void OnXChanging(double value);
		partial void OnXChanged();
		private double _X;
		[Column(Storage=@"_X", DbType=@"Float NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.WhenChanged)]
		public double X
		{
			get { return _X; }
			set {
				if (_X != value) {
					OnXChanging(value);
					SendPropertyChanging();
					_X = value;
					SendPropertyChanged("X");
					OnXChanged();
				}
			}
		}
		
		partial void OnYChanging(double value);
		partial void OnYChanged();
		private double _Y;
		[Column(Storage=@"_Y", DbType=@"Float NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.WhenChanged)]
		public double Y
		{
			get { return _Y; }
			set {
				if (_Y != value) {
					OnYChanging(value);
					SendPropertyChanging();
					_Y = value;
					SendPropertyChanged("Y");
					OnYChanged();
				}
			}
		}
		
		partial void OnZChanging(double value);
		partial void OnZChanged();
		private double _Z;
		[Column(Storage=@"_Z", DbType=@"Float NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.WhenChanged)]
		public double Z
		{
			get { return _Z; }
			set {
				if (_Z != value) {
					OnZChanging(value);
					SendPropertyChanging();
					_Z = value;
					SendPropertyChanged("Z");
					OnZChanged();
				}
			}
		}
		
		partial void OnVerticiesChanging(Binary value);
		partial void OnVerticiesChanged();
		private Binary _Verticies;
		[Column(Storage=@"_Verticies", DbType=@"VarBinary(64)", UpdateCheck=UpdateCheck.WhenChanged)]
		public Binary Verticies
		{
			get { return _Verticies; }
			set {
				if (_Verticies != value) {
					OnVerticiesChanging(value);
					SendPropertyChanging();
					_Verticies = value;
					SendPropertyChanged("Verticies");
					OnVerticiesChanged();
				}
			}
		}
		
		partial void OnClosedChanging(bool value);
		partial void OnClosedChanged();
		private bool _Closed;
		[Column(Storage=@"_Closed", DbType=@"Bit NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.WhenChanged)]
		public bool Closed
		{
			get { return _Closed; }
			set {
				if (_Closed != value) {
					OnClosedChanging(value);
					SendPropertyChanging();
					_Closed = value;
					SendPropertyChanged("Closed");
					OnClosedChanged();
				}
			}
		}
		
		partial void OnVersionChanging(Binary value);
		partial void OnVersionChanged();
		private Binary _Version;
		[Column(Storage=@"_Version", AutoSync=AutoSync.Always, DbType=@"rowversion NOT NULL", IsDbGenerated=true, IsVersion=true, CanBeNull=false)]
		public Binary Version
		{
			get { return _Version; }
			set {
				if (_Version != value) {
					OnVersionChanging(value);
					SendPropertyChanging();
					_Version = value;
					SendPropertyChanged("Version");
					OnVersionChanged();
				}
			}
		}
		
		partial void OnTagsChanging(string value);
		partial void OnTagsChanged();
		private string _Tags;
		[Column(Storage=@"_Tags", DbType=@"Xml", UpdateCheck=UpdateCheck.WhenChanged)]
		public string Tags
		{
			get { return _Tags; }
			set {
				if (_Tags != value) {
					OnTagsChanging(value);
					SendPropertyChanging();
					_Tags = value;
					SendPropertyChanged("Tags");
					OnTagsChanged();
				}
			}
		}
		
		partial void OnVolumeXChanging(double value);
		partial void OnVolumeXChanged();
		private double _VolumeX;
		[Column(Storage=@"_VolumeX", DbType=@"Float NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.WhenChanged)]
		public double VolumeX
		{
			get { return _VolumeX; }
			set {
				if (_VolumeX != value) {
					OnVolumeXChanging(value);
					SendPropertyChanging();
					_VolumeX = value;
					SendPropertyChanged("VolumeX");
					OnVolumeXChanged();
				}
			}
		}
		
		partial void OnVolumeYChanging(double value);
		partial void OnVolumeYChanged();
		private double _VolumeY;
		[Column(Storage=@"_VolumeY", DbType=@"Float NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.WhenChanged)]
		public double VolumeY
		{
			get { return _VolumeY; }
			set {
				if (_VolumeY != value) {
					OnVolumeYChanging(value);
					SendPropertyChanging();
					_VolumeY = value;
					SendPropertyChanged("VolumeY");
					OnVolumeYChanged();
				}
			}
		}
		
		partial void OnTerminalChanging(bool value);
		partial void OnTerminalChanged();
		private bool _Extensible;
		[Column(Storage=@"_Extensible", DbType=@"Bit NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.WhenChanged)]
		public bool Terminal
		{
			get { return _Extensible; }
			set {
				if (_Extensible != value) {
					OnTerminalChanging(value);
					SendPropertyChanging();
					_Extensible = value;
					SendPropertyChanged("Terminal");
					OnTerminalChanged();
				}
			}
		}
		
		partial void OnOffEdgeChanging(bool value);
		partial void OnOffEdgeChanged();
		private bool _OffEdge;
		[Column(Storage=@"_OffEdge", DbType=@"Bit NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.WhenChanged)]
		public bool OffEdge
		{
			get { return _OffEdge; }
			set {
				if (_OffEdge != value) {
					OnOffEdgeChanging(value);
					SendPropertyChanging();
					_OffEdge = value;
					SendPropertyChanged("OffEdge");
					OnOffEdgeChanged();
				}
			}
		}
		
		partial void OnRadiusChanging(double value);
		partial void OnRadiusChanged();
		private double _Radius;
		[Column(Storage=@"_Radius", DbType=@"Float NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.WhenChanged)]
		public double Radius
		{
			get { return _Radius; }
			set {
				if (_Radius != value) {
					OnRadiusChanging(value);
					SendPropertyChanging();
					_Radius = value;
					SendPropertyChanged("Radius");
					OnRadiusChanged();
				}
			}
		}
		
		partial void OnTypeCodeChanging(short value);
		partial void OnTypeCodeChanged();
		private short _TypeCode;
		[Column(Storage=@"_TypeCode", DbType=@"smallint NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.WhenChanged)]
		public short TypeCode
		{
			get { return _TypeCode; }
			set {
				if (_TypeCode != value) {
					OnTypeCodeChanging(value);
					SendPropertyChanging();
					_TypeCode = value;
					SendPropertyChanged("TypeCode");
					OnTypeCodeChanged();
				}
			}
		}
		
		partial void OnLastModifiedChanging(DateTime value);
		partial void OnLastModifiedChanged();
		private DateTime _LastModified = default(DateTime);
		[Column(Storage=@"_LastModified", AutoSync=AutoSync.Always, DbType=@"DateTime NOT NULL", IsDbGenerated=true, CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public DateTime LastModified
		{
			get { return _LastModified; }
		}
		
		partial void OnUsernameChanging(string value);
		partial void OnUsernameChanged();
		private Link<string> _Username;
		[Column(Storage=@"_Username", DbType=@"NText NOT NULL", CanBeNull=false)]
		public string Username
		{
			get { return _Username.Value; }
			set {
				if (_Username.Value != value) {
					OnUsernameChanging(value);
					SendPropertyChanging();
					_Username.Value = value;
					SendPropertyChanged("Username");
					OnUsernameChanged();
				}
			}
		}
		
		partial void OnCreatedChanging(DateTime value);
		partial void OnCreatedChanged();
		private DateTime _Created = default(DateTime);
		[Column(Storage=@"_Created", AutoSync=AutoSync.Always, DbType=@"DateTime NOT NULL", IsDbGenerated=true, CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public DateTime Created
		{
			get { return _Created; }
		}
		
		#endregion
		
		#region Associations
		private EntitySet<DBLocationLink> _SourcedBy;
		[Association(Name=@"DBLocation_DBLocationLink", Storage=@"_SourcedBy", ThisKey=@"ID", OtherKey=@"LinkedFrom")]
		public EntitySet<DBLocationLink> IsLinkedTo
		{
			get {
				return _SourcedBy;
			}
			set {
				_SourcedBy.Assign(value);
			}
		}

		private void attach_IsLinkedTo(DBLocationLink entity)
		{
			SendPropertyChanging();
			entity.SourceLocation = this;
		}
		
		private void detach_IsLinkedTo(DBLocationLink entity)
		{
			SendPropertyChanging();
			entity.SourceLocation = null;
		}
		
		private EntitySet<DBLocationLink> _TargettedBy;
		[Association(Name=@"DBLocation_DBLocationLink1", Storage=@"_TargettedBy", ThisKey=@"ID", OtherKey=@"LinkedTo")]
		public EntitySet<DBLocationLink> IsLinkedFrom
		{
			get {
				return _TargettedBy;
			}
			set {
				_TargettedBy.Assign(value);
			}
		}

		private void attach_IsLinkedFrom(DBLocationLink entity)
		{
			SendPropertyChanging();
			entity.TargetLocation = this;
		}
		
		private void detach_IsLinkedFrom(DBLocationLink entity)
		{
			SendPropertyChanging();
			entity.TargetLocation = null;
		}
		
		private EntityRef<DBStructure> _DBStructure;
		[Association(Name=@"DBStructure_DBLocation", Storage=@"_DBStructure", ThisKey=@"ParentID", OtherKey=@"ID", IsForeignKey=true)]
		public DBStructure DBStructure
		{
			get {
				return _DBStructure.Entity;
			}
			set {
				DBStructure previousValue = _DBStructure.Entity;
				if ((previousValue != value) || (!_DBStructure.HasLoadedOrAssignedValue)) {
					SendPropertyChanging();
					if (previousValue != null) {
						_DBStructure.Entity = null;
						previousValue.DBLocations.Remove(this);
					}
					_DBStructure.Entity = value;
					if (value != null) {
						value.DBLocations.Add(this);
						_ParentID = value.ID;
					}
					else {
						_ParentID = default(long);
					}
					SendPropertyChanged("DBStructure");
				}
			}
		}

		#endregion
	}
}
#pragma warning restore 1591