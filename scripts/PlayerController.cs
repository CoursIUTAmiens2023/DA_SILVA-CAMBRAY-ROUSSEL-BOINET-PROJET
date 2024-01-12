using Godot;
using System;

public partial class PlayerController : CharacterBody2D
{

	public float moveSpeed = 150.0f;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _PhysicsProcess(double delta)
	{
		Vector2 velocity = Velocity;

		velocity.X = 0;
		if (Input.IsKeyPressed(Key.Left))
			velocity.X = -moveSpeed;
		else if (Input.IsKeyPressed(Key.Right))
			velocity.X = +moveSpeed;
		else if (Input.IsKeyPressed(Key.Up))
			velocity.Y = -moveSpeed;
		else if (Input.IsKeyPressed(Key.Down))
			velocity.Y = +moveSpeed;

		Velocity = velocity;
		MoveAndSlide();
	}
}
