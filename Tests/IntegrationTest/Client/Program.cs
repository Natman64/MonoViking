using System;
using MonogameTest;
using Gtk;
using System.Threading;

namespace Client
{
	public class Program
	{
		public static void Main (string[] args)
		{


			Game1 game = new Game1 ();

			Thread thread = new Thread ( () => { game.Run(); });
			thread.Start ();

			for (int i = 0; i < 100000; i++) {
				for (int j = 0; j < 100; j++) {
				}
			}

			Application.Init ();
			MainWindow window = new MainWindow ();
			window.Game = game;

			window.Show ();
			Application.Run ();
		}
	}
}

