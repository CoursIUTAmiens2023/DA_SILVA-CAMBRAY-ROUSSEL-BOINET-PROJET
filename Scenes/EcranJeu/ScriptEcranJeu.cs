using Godot;
using System;

public partial class ScriptEcranJeu : Node2D
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
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
		
	}
}
