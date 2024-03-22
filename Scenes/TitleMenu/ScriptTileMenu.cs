using Godot;
using System;

public partial class ScriptTileMenu : Godot.CanvasLayer
{	
	/* -- Actions of each buttons of the title menu screen -- */
	// Button play 
	private void _on_button_play_pressed()
	{
		// Change to the game scene
		// TODO ADD PATH GAME SCENE
		String GameScenePath = "res://Scenes/EcranJeu/ecran_jeu.tscn";
		GetTree().ChangeSceneToFile(GameScenePath);
	}
	
	// Button credits
	private void _on_button_credits_pressed()
	{
		// Hide the title menu
		var MainMenu = GetNode<Control>("MainMenu");
		MainMenu.Visible = false;
		// Show the credit screen
		var Credit = GetNode<Control>("CreditsMenu");
		Credit.Visible = true;
	}
	
	// Button retour credits 
	private void _on_button_back_pressed()
	{
		// Hide the credit screen
		var Credit = GetNode<Control>("CreditsMenu");
		Credit.Visible = false;
		// Show the title menu
		var MainMenu = GetNode<Control>("MainMenu");
		MainMenu.Visible = true;
	}
	
	// Button quit program
	private void _on_button_quit_pressed()
	{
		GetTree().Quit();
	}
}



