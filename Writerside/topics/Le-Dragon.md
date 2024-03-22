# Le Dragon

Le personnage principal est un dragon de feu. Dans le jeu il est sur le chemin du retour mais il est blessé. Il a perdu nombre de ses capacités et doit rentrer chez lui en annihilant les différents envahisseurs qui lui barrent la route.


## Gestion du personnage

Le dragon hésite de la classe `Character2DBody` qui est une classe abstraite qui permet de gérer les collisions et les déplacements.

```Java
    extends CharacterBody2D
```

### Les constantes

On déclare la vitesse et la vie du dragon

```Javascript
    @export var speed = 400
    @export var health = 3
```

### Le Sprite

Le sprite du dragon est un dragon rouge. Il est animé et possède une animation de vol. Il est également animé lorsqu'il tire.
Nous avons trouvé ce sprite sur [OpenGameArt](https://opengameart.org/content/flying-dragon-rework).

Le sprite est animé en fonction de si le dragon bouge ou non.
```Javascript
func playerAnimation():
	if(currentState == State.Idle):
		animated_sprite_2d.play("standBy")
	elif (currentState == State.Fly):
		animated_sprite_2d.play("fly")
```

![dragon.gif](dragon.gif){width="450"}

### La fonction principale
Elle est appelée à chaque frame et permet de gérer tout ce qui concerne le dragon.
Nous reviendrons sur toutes les fonctions juste après.

```Javascript
    func _physics_process(delta):
        playerFly(delta)
        playerAnimation()
        playerShooting(delta)
        die()
```



### Les capacités

Le dragon possède plusieurs capacités :
- Tirer des boules de feu en appyant sur `s` (pour shoot)
- Tirer des Kamehameha en appuyant sur `d` (pour on sait pas mais c'était plus simple comme c'est à coté du s)

Voici le code qui gère les capacités, à savoir que delta correspond au temps écoulé depuis la dernière frame.
Selon quelle touche est appuyée, le dragon attaque de manière différente.

```Javascript
    func playerShooting(delta):
    
        //Cette partie permet de gérer le tir de boule de feu
        if (Input.is_action_just_pressed("shoot") && !cooldoonShoot):
            //Change l'état du joueur pour le mettre en mode tir
            currentState = State.Shoot
            
            //Instancie une boule de feu
            var fireballInstance = fireball.instantiate() as Node2D
            
            //Positionne la boule de feu au niveau du muzzle, le muzzle étant le point de départ du tir
            fireballInstance.global_position = muzzle.global_position
            
            //Ajoute la boule de feu à la scène
            get_parent().add_child(fireballInstance)
            
            //Met le cooldown du tir à true pour éviter de tirer en continu
            cooldoonShoot = true
        
        //Cette partie permet de gérer le tir de Kamehameha
        if (Input.is_action_pressed("rayshoot")):
            
            //Change l'état du joueur pour le mettre en mode tir
            currentState = State.Shoot
            
            //Instancie un Kamehameha
            var baseWaveInstance = baseWave.instantiate() as Node2D
            
            //Positionne le Kamehameha au niveau du muzzle, le muzzle étant le point de départ du tir
            baseWaveInstance.global_position = muzzle.global_position
            
            //Ajoute le Kamehameha à la scène
            get_parent().add_child(baseWaveInstance)
            
            //Instancie un effet de vague (c'est uniquement là pour le style)
            var waveBlastInstance = waveBlast.instantiate() as Node2D
            
            //Positionne l'effet de vague au niveau du muzzle, le muzzle étant encore et toujours le point de départ du tir
            waveBlastInstance.global_position = muzzle.global_position
            
            //Ajoute l'effet de vague à la scène
            get_parent().add_child(waveBlastInstance)
```

### La hitbox

Nous avons mis en place un hitbox assez simpliste.
Celle-ci servira à gérer les collisions avec les ennemis et principalement les tirs ennemis.
Elle permet aussi au dragon de ne pas dire au revoir à la vie en sortant de l'écran 😉.

![dragon_hitbox.png](dragon_hitbox.png){width="450"}

### Les déplacements

Le dragon se déplace en fonction des touches appuyées.
Il faudra donc utiliser les flèches directionnelles pour le déplacer.

`↑ Touche flèche du haut` : Permet de monter  
`↓ Touche flèche du bas` : Permet de descendre  
`→ Touche flèche de droite` : Permet d'aller à droite  
`← Touche flèche de gauche` : Permet d'aller à gauche

```Javascript
    func playerFly(delta):
        if Input.is_action_pressed("move_down"):
            currentState = State.Fly
            velocity.x = 0
            velocity.y = speed
        elif Input.is_action_pressed("move_up"):
            currentState = State.Fly
            velocity.x = 0
            velocity.y = -speed
        elif Input.is_action_pressed("move_left"):
            currentState = State.Fly
            velocity.x = -speed
            velocity.y = 0
        elif Input.is_action_pressed("move_right"):
            currentState = State.Fly
            velocity.x = speed
            velocity.y = 0
        else:
            currentState = State.Idle
            velocity.x = 0
            velocity.y = 0
		
	    move_and_slide()
```

### La mort du dragon

La fonction `die()` est appelée dans le processus principal.  
Elle vérifie si la vie du dragon est inférieure ou égale à 0. Si c'est le cas, le dragon est détruit.  
Il est mort quoi, c'est triste mais c'est la vie.  
C'est aussi triste car ça veut dire que vous avez perdu 😢.
