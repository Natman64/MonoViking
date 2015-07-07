using System;
using Gtk;
using MonogameTest;

public partial class MainWindow: Gtk.Window
{
	public Game1 Game {
		get;
		set;
	}

	public MainWindow () : base (Gtk.WindowType.Toplevel)
	{
		Build ();
	}

	protected void OnDeleteEvent (object sender, DeleteEventArgs a)
	{
		Application.Quit ();
		a.RetVal = true;
	}

	protected void OnButton1Clicked (object sender, EventArgs e)
	{
		if (Game != null) {
			Game.Swap ();
		}
	}
}
