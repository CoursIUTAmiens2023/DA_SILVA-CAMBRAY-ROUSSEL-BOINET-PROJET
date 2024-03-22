# Le Menu

En lançant le jeu, vous arrivez sur le menu principal. Celui-ci est composé de plusieurs éléments :

<deflist type="medium" sorted="none">
    <def title="Bouton Jouer">
        Ce bouton permet de lancer une partie. Il est relié à une fonction qui change de scène pour lancer une partie.
    </def>
    <def title="Bouton Crédits">
        Ce bouton permet d'afficher les crédits du jeu. Il est relié à une fonction qui cache le menu principal et affiche le menu des crédits.
    </def>
    <def title="Bouton Quitter">
        Ce bouton permet de quitter le jeu. Il est relié à une fonction qui ferme l'application.
    </def>
</deflist>

Au niveau du code son implémentation est assez simple.
Pour cette partie du jeu nous avons utilisé du .Net/C#

<tip>
    <p>
        Mais qu'il est beau ce menu, n'est-ce pas ?
    </p>
</tip>

![title-screen.png](title-screen.png){width="450"}

## Les bibliothèques utilisées

Pour cette partie du jeu nous avons utilisé les bibliothèques suivantes :
```C#
using Godot;
using System;
```
{collapsible="false" collapsed-title="Using"}

## Les boutons

Les boutons sont des éléments de base de Godot. Ils sont très simples à utiliser et à mettre en place.
Il suffit de créer un bouton dans le fichier .tscn et de lui ajouter un script pour gérer son comportement.
Ci dessous, les scripts des boutons du menu principal :

### Le bouton "Jouer"

```C#
private void _on_button_play_pressed()
    {
        // Change de scène pour lancer le jeu
        String GameScenePath = "res://Scenes/EcranJeu/ecran_jeu.tscn";
        GetTree().ChangeSceneToFile(GameScenePath);
    }
```

### Le bouton "Crédits"

```C#
private void _on_button_credits_pressed()
{
    // Cette partie permet de cacher le menu principal
	var MainMenu = GetNode<Control>("MainMenu");
	MainMenu.Visible = false;
	
	// Cette partie permet d'afficher le menu des crédits
	var Credit = GetNode<Control>("CreditsMenu");
	Credit.Visible = true;
}
```
### Le bouton "Quitter"

```C#
private void _on_button_quit_pressed()
{
    // Ce code permet de quitter le jeu et en d'autres termes de fermer l'application
	GetTree().Quit();
}
```