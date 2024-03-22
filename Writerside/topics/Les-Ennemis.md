# Les Ennemis

Les ennemis sont les différents obstacles que le dragon devra affronter pour rentrer chez lui. Ils sont de plusieurs types et possèdent chacun des caractéristiques différentes.
Ils ont été codés en GDScript et héritent de la Classe `Character2DBody`

Il y a 3 types d'ennemis dans le jeu :  

{type="medium" sorted="none"}
![diable.png](diable.png){width="100"} Le diable
: Il est le plus commun des ennemis. Il est assez rapide ainsi qu'assez simple à battre.

![minion.png](minion.png){width="100"} Le Minion
: Il est plus rare que le diable. Il est plus lent mais il est plus résistant.

![phantom.png](phantom.png){width="100"} Le Phantom
: Il est le plus rare des ennemis. Il est encore plus lent que le minion mais est encore plus résistant.

## Les scripts liés aux ennemis

Pour commencé comme cité plus haut les scripts des ennemis sont dévéloppés en GDScript.

### Dépendances
Chaque ennemi hérite de la classe `Character2DBody` qui est une classe abstraite qui permet de gérer les collisions et les déplacements des ennemis.

```Java
    extends CharacterBody2D
```

### Les constantes

Chaque ennemi possède des constantes qui lui sont propres. Par exemple, la vitesse de déplacement, la vie, les dégâts infligés, etc.

```Javascript
    @export var health = 100
    var speed = 50
    var score = 20
```

### Processus Principal (Déplacement)

Le processus simplement appelé `_process` permet de gérer le déplacement de l'ennemi.
Il prend en paramètre `delta` qui est le temps écoulé depuis la dernière frame.
On prend ici comme exemple la procédure process du diable.
Nous reviendrons sur la procédure `die()` juste après.
```Javascript
    func _process(delta):
	    global_position.y += speed * delta
	    diable_sprite.play("default")
	    die()
```

### La gestion des collisions
Dans un jeu vidéo, il est important de gérer les collisions. Cela permet de savoir si un objet est entré en collision avec un autre objet.
Chaque entité possède une hitbox qui est un rectangle qui entoure l'entité.
Dans notre cas, nous avons une hitbox pour chaque ennemi qui quand elle rentre en collision avec la hitbox d'une autre entité
appelle la fonction `_on_hurtbox_area_entered` qui permet de gérer les dégâts infligés à l'entité.

```Javascript
    func _on_hurtbox_area_entered(area):
        if(area.get_parent().has_method("getDamageAmount")):
            var node = area.get_parent() as Node
            health -= node.damageBullet
        if(area.get_parent().has_method("getWaveDamage")):
            var node = area.get_parent() as Node
            health -= node.damageWave
        if(area.get_parent().has_method("isPlayer")):
            queue_free()
```

### La mort de l'ennemi
Vous voyez je ne vous ai pas menti, la fonction `die()` est bien appelée dans le processus principal.
Elle vérifie si la vie de l'ennemi est inférieure ou égale à 0. Si c'est le cas, l'ennemi est détruit.

```Javascript
    func die():
        if(health <= 0):
            var deathInstance = death.instantiate() as Node2D
            deathInstance.global_position = global_position
            get_parent().add_child(deathInstance)
            queue_free()
```
