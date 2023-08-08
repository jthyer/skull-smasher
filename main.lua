require("src.bg.bgPillars")
require("src.skull")

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest", 1)
  love.window.setTitle("Skull Slasher")

  SCREENWIDTH = love.graphics.getWidth()
  SCREENHEIGHT = love.graphics.getHeight()
  
  loadBG()
  loadSkull()
end

function love.update(dt)
  local delta = dt
  if delta > 0.1 then delta = 0.1 end
  
  updateBG(delta)  
  updateSkull(delta)
end

function love.draw()
  drawBG()
  drawSkull()
  drawFG()

end

function love.keypressed(key, scancode)
   if key == "escape" then
      love.event.quit()
   end
end