using Godot;
using System;

public partial class ScriptEcranJeu : Node2D
{
	private DateTime Chrono;
	private double IntervalPassed; // Used to know when one second has passed
	
	private int RemainingLifes;

	private int Score;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		this.Chrono = new DateTime();		
		this.IntervalPassed = 0;
		
		this.RemainingLifes = 3;
		
		this.Score = 0;
		
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		// Get the background parallax
		var BG = GetNode<ParallaxBackground>("Background");
		
		// Move the background to the bottom
		if (BG != null) {
			Vector2 CurrentVector = BG.ScrollBaseOffset;
			Vector2 NewVector = CurrentVector - (new Vector2(0, -100) * (float)delta);
			BG.ScrollBaseOffset = NewVector;
		}
		
		// Update the chrono and display it on the screen
		IntervalPassed += delta;
		
		var TimePassed = GetNode<Label>("CanvasLayer/Time/TimePassed");
		
		if (IntervalPassed >= 1) {
			IntervalPassed=0;
			this.Chrono = this.Chrono.AddSeconds(1);
			if (TimePassed != null ) {
				TimePassed.Text = this.Chrono.ToString("mm:ss")+ " s";
			}
		}

        // Update the score 
        var ScoreDisplayed = GetNode<Label>("./CanvasLayer/ScoreAndLife/ScorePlayer");
        ScoreDisplayed.Text = this.Score.ToString();
		
    }	
	
	public void LostOneLife() {
		if (this.RemainingLifes > 0) {
			// Hide a image of a life 
			String NameImgLife = "Life" + this.RemainingLifes.ToString();
			var ImgToHide = GetNode<TextureRect>("CanvasLayer/ScoreAndLife/GridContainer/" + NameImgLife);
			if (ImgToHide != null) {
				ImgToHide.Hide();
			}	
			// Substract a life
			this.RemainingLifes-=1;
		} else {
			// End the game 
			// TODO : end the game 
		}
	}
	
	public void GainPoint(int PointsGained) {
		this.Score += PointsGained;
    }

	public String getScore()
	{
		return this.Score.ToString();
	}
}
