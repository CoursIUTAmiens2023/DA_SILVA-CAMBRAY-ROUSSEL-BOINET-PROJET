# Le Dragon

Le personnage principal est un dragon de feu. Dans le jeu il est sur le chemin du retour mais il est blessé. Il a perdu nombre de ses capacités et doit rentrer chez lui en annihilant les différents envahisseurs qui lui barrent la route.


## Gestion du personnage

### Le Sprite

Le sprite du dragon est un dragon rouge. Il est animé et possède une animation de vol. Il est également animé lorsqu'il tire.
Nous avons trouvé ce sprite sur [OpenGameArt](https://opengameart.org/content/flying-dragon-rework).

![dragon.gif](dragon.gif){width="450"}

### Les capacités

Le dragon possède plusieurs capacités :
- Tirer des boules de feu en appyant sur s (pour shoot)
- Tirer des Kamehameha en appuyant sur d (pour on sait pas mais c'était plus simple comme c'est à coté du s)

### La hitbox

Nous avons mis en place un hitbox assez simpliste.
Celle-ci servira à gérer les collisions avec les ennemis et principalement les tirs ennemis.
Elle permet aussi au dragon de ne pas dire au revoir à la vie en sortant de l'écran 😉.

![dragon_hitbox.png](dragon_hitbox.png){width="450"}