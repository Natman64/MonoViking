using System;
using System.Windows.Forms;

using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;

namespace VikingXNA
{
    /// <summary>
    /// Based on code from this thread:
    /// http://community.monogame.net/t/nullreferenceexception-creating-graphicsdevice/1243/5
    /// </summary>
    public class GraphicsEngine : Game
    {
        #region Fields

        private GraphicsDeviceManager mGraphicsDeviceManager = null;

        #endregion

        #region Properties

        public bool UseExternalWindow
        {
            get;
            set;
        }

        public PresentationParameters PresentationParameters
        {
            get;
            set;
        }

        #endregion

        #region Initialization

        public GraphicsEngine() : base()
        {
            mGraphicsDeviceManager = new GraphicsDeviceManager(this);

            PresentationParameters = null;
            UseExternalWindow = false;

            mGraphicsDeviceManager.PreparingDeviceSettings += OnPreparingDeviceSettings;
        }

        #endregion

        #region Event Handlers

        private void OnPreparingDeviceSettings(object sender, PreparingDeviceSettingsEventArgs e)
        {
            if (UseExternalWindow && PresentationParameters != null)
            {
                Form gameForm = Control.FromHandle(this.Window.Handle) as Form;

                if (gameForm != null)
                    gameForm.Shown += HideGameWindow;

                // TODO set other presentation parameters

                e.GraphicsDeviceInformation.PresentationParameters = PresentationParameters;
            }
        }

        private void HideGameWindow(object sender, EventArgs e)
        {
            Form gameForm = sender as Form;
            if (gameForm != null)
            {
                gameForm.Hide();
            }
        }

        #endregion
    }
}
