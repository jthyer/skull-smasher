
local skull = {}


function loadSkull()
  skull = {}
  skull.sprite = love.graphics.newImage("assets/sprites/skull.png")
  skull.mask = love.graphics.newImage("assets/sprites/skull_mask.png")
  skull.x = 200
  skull.y = 300
  skull.z = 15
  skull.rotation = 0

end

function updateSkull(dt)
  --skull.model.set
  --skull.x = skull.x + dt*10
  skull.z = skull.z - (dt * 3)
  if skull.z < 1 then
    skull.z = 15
  end
  skull.alpha = skull.z/15
  --skull.rotation = skull.rotation + dt*2
  --skull.model:setTranslation(skull.x,skull.y,skull.z)
  --skull.model:setRotation(0,skull.rotation,0)
end

function drawSkull(dt)
  love.graphics.setColor(1,0.8,0.8,1)
  love.graphics.draw(skull.sprite,skull.x,skull.y,0,4/skull.z,4/skull.z)
  love.graphics.setColor(1,1,1,skull.alpha)
  love.graphics.draw(skull.mask,skull.x,skull.y,0,4/skull.z,4/skull.z)
  love.graphics.setColor(1,1,1,1)
end

