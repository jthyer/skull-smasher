Test commit 3.

world variables:
- timer: This is the only thing that matters for generating enemy waves expanse style. The level just iterates through a timed list of entities. 
- score
- number of lives

the player is just an entity that happens to be connected with the keyboard. it can interact with the score and number of lives world state. 

I can worry about adding a tile map later.

Remember to try love.graphics.setCanvas for doing the tile map background