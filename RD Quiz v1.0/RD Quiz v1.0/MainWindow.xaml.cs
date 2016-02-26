//TODO: Comments, mute control, scene switcher

using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace RD_Quiz_v1._0 {
	public partial class MainWindow : Window {

		const string VID_PATH = "videos/";      // Base path for videos
		readonly SolidColorBrush
			BRUSH_GREEN = new SolidColorBrush(Color.FromArgb(255,  30,  255,  30)),
			BRUSH_RED   = new SolidColorBrush(Color.FromArgb(255, 240,   10,  10)),
			BRUSH_WHITE = new SolidColorBrush(Colors.White);

		private Scene[] scenes;					// Store all Scene objects
		private short	lastVid		= 0,		// Keep track of last video to return on failure
						currNdx		= 0;		// Current Scene
		private bool	holdScene	= false;    // Hold up Continue button when false


		//*****Main methods*****//

		/// Initialize window.
		public MainWindow () {
			PopulateQuiz();				// See PopulateQuiz.cs
			InitializeComponent();		
		}


		/// Handle Continue button presses differentially based on whether the quiz is completed, whether holdScene flag has been thrown and whether the scene is a video or question.
		private void btnContinue_Click ( object sender, RoutedEventArgs e ) {
			if (holdScene) {
				holdScene = false;
				SwitchScene(currNdx);
			} else if (scenes[currNdx].HasVideo)
				SwitchScene(++currNdx);
			else
				CheckAnswer(); 
        }


		/// Call when user has selected an answer and hit continue to check answer and evaluate
		private void CheckAnswer () {

			foreach (RadioButton rb in stackQuiz.Children)
				if ((bool)rb.IsChecked) {
					if (((Response)rb.Tag).IsCorrect) {
						tbCaption.Foreground	= BRUSH_GREEN;
						tbCaption.Text			= "Correct!";
						currNdx++;
					} else {
						tbCaption.Foreground	= BRUSH_RED;
						tbCaption.Text			= "Incorrect : " + ((Response)rb.Tag).FalseReason;
						currNdx					= lastVid;
					}
					holdScene			= true;		// Hold up current scene progression
					stackQuiz.IsEnabled	= false;	// Disable StackPanel
					return;
				}
		}


		/// Switches the current scene to the specified ndx
		private void SwitchScene(short ndx) {

			// Quit program if user has finished all questions
			if (ndx >= scenes.Length) {				
				MessageBox.Show("Congratulations! You have completed the quiz.", "Quiz Complete");
				Close();
				return;
			}

			// Otherwise, refresh scene layout	.	.	.	.	.	.	.	.	.
			Scene scene				= scenes[ndx];		// Advance to scene at current ndx
			lblTitle.Content		= scene.Title;      // Change to new title and caption
			tbCaption.Text			= scene.Caption;
			tbCaption.Foreground	= BRUSH_WHITE;		// Reset caption color
			stackQuiz.IsEnabled		= true;             // Reset StackPanel
			btnContinue.IsEnabled	= false;			// Disable Continue
			stackQuiz.Children.Clear();					// Clear old quiz questions

		// For scenes with videos . . .
			if (scene.HasVideo) {
				btnReplay.IsEnabled		= true;
				vidPlayer.Visibility	= Visibility.Visible;
				lastVid					= ndx;

				Uri newSource			= vidPlayer.Source;				// If TryCreate fails, retain last video
				Uri.TryCreate(VID_PATH + scene.FilePath, UriKind.Relative, out newSource);
				vidPlayer.Source		= newSource;
			} 
		// ... and for scenes with only questions
			else {
				vidPlayer.Visibility	= Visibility.Hidden;
				btnReplay.IsEnabled		= false; 

				// Generate radio buttons corresponding to each Response
				foreach (Response re in scene.Responses) {
					RadioButton rbNew = new RadioButton() {
						Content     = re.Text,
						Tag         = re,
						Margin		= new Thickness(10, 20, 50, 20),
						Padding		= new Thickness(0,  20,  0, 20),
					};

					rbNew.Checked += new RoutedEventHandler(rb_Checked);
					stackQuiz.Children.Add(rbNew);
                }
			}
		}


		//***** Simple event handlers *****//

		/// Enable and draw Focus to Continue button if any RadioButton becomes checked
		private void rb_Checked ( object sender, RoutedEventArgs e ) { btnContinue.IsEnabled = true; btnContinue.Focus(); }

		/// Replay current video from beginning.
		private void btnReplay_Click ( object sender, RoutedEventArgs e ) { vidPlayer.Stop(); vidPlayer.Play(); }

		/// Enable and draw focus to Continue button when video is done playing.
		private void vidPlayer_MediaEnded ( object sender, RoutedEventArgs e ) { btnContinue.IsEnabled = true; btnContinue.Focus(); }

		/// Play first video on load.
		private void QuizWindow_Loaded ( object sender, RoutedEventArgs e ) { SwitchScene(currNdx); vidPlayer.Play(); }

	}
}
