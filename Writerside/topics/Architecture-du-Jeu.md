# 2 - Architecture du Jeu

Le Jeu comme dit dans l'[Introduction](Introduction.md) est un jeu de type **Shoot Them Up** développé avec le moteur de jeu **Godot**.
Godot propose deux langages de programmation pour le développement de jeux : **GDScript** et **C#**. Nous avons choisi d'utiliser le [Cross-language scripting](https://docs.godotengine.org/en/stable/tutorials/scripting/cross_language_scripting.html) de Godot pour développer le jeu en **C#** et en **GDScript**.

## 2.1 - Structure du projet

Le projet est structuré de la manière suivante :

- **assets** : Contient les assets du jeu (images, sons, musiques, etc.)
- **scenes** : Contient les scènes du jeu (menu, jeu, etc.)
- **scripts** : Contient les scripts du jeu (C# et GDScript)
- **settings** : Contient les paramètres du jeu (résolution, etc.)
- **test** : Contient les tests du jeu

Godot a été choisi pour son aspect flexible. Il est, par exemple, possible de faire de la 2d comme de la 3d. De plus il possède l'avantage non négligeable d'être gratuit et Open source.
Comme son interface est assez intuitive, il est facile de s'y adapter, idéal pour les équipes possédant des degrés de compétences différents sur le moteur.