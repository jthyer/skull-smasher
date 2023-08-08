local g3d = require("lib/g3d")

local foreground = g3d.newModel("assets/model/sphere.obj", "assets/model/fog.png", nil, nil, 2)  
local stone = love.graphics.newImage("assets/model/greyBrick.jpg")
local stone2 = love.graphics.newImage("assets/model/stoneFloor.jpg")
local fade = love.graphics.newImage("assets/model/fade.png")
local black = love.graphics.newImage("assets/model/black.png")

local floor = {}
local floor2 = {}
local pillars = {}
local timer = 0

function loadFloor()
  floor.model1 = g3d.newModel("assets/model/plane.obj", stone2, nil, nil, 10)
  floor.model2 = g3d.newModel("assets/model/plane.obj", stone2, nil, nil, 10)
  floor.fade =   g3d.newModel("assets/model/plane.obj", fade, {7,0,-1.99}, nil, 10)
  floor.black =  g3d.newModel("assets/model/plane.obj", black, {26,0,-1.98}, nil, 10)
  floor.pos1 = 7
  floor.pos2 = 26
  
  floor2.model1 = g3d.newModel("assets/model/plane.obj", stone2, nil, nil, 10)
  floor2.model2 = g3d.newModel("assets/model/plane.obj", stone2, nil, nil, 10)
  floor2.fade =   g3d.newModel("assets/model/plane.obj", fade, {7,0,4-2.02}, nil, 10)
  floor2.black =  g3d.newModel("assets/model/plane.obj", black, {26,0,4-2.03}, nil, 10)
  floor2.pos1 = 7
  floor2.pos2 = 26
end

function updateFloor(f, z, dt)
  f.pos1 = f.pos1 - (dt*3)
  f.pos2 = f.pos2 - (dt*3)
  
  if f.pos1 < 7-19 then f.pos1 = 26 end
  if f.pos2 < 7-19 then f.pos2 = 26 end
  f.model1:setTranslation(f.pos1,0,z-2)
  f.model2:setTranslation(f.pos2,0,z-2.01)
end

function loadPillar(p)
  local pillar = {}
  pillar.model1 = g3d.newModel("assets/model/cylinder.obj", stone, nil, {0,0,1.57}, {0.2, 0.2, 2})
  pillar.model2 = g3d.newModel("assets/model/cylinder.obj", stone, nil, {0,0,-1.57}, {0.2, 0.2, 2})
  pillar.pos = p

  updatePillar(pillar)
 
  return pillar
end

function updatePillar(pillar)
  if pillar.pos < 0 then
    pillar.pos = 10
  end
  pillar.model1:setTranslation(pillar.pos*1.5,-2,0)
  pillar.model2:setTranslation(pillar.pos*1.5,2,0)
end

function loadBG()
  loadFloor()
  for i=1,10 do
    table.insert(pillars, loadPillar(i))
  end
end

function updateBG(dt)
  timer = timer + (dt/2)
  
  updateFloor(floor, 0, dt)
  updateFloor(floor2,4, dt)
  
  for i,v in ipairs(pillars) do
    v.pos = v.pos - (dt * 2)
    updatePillar(v)
  end
  
  foreground:setRotation(1.57,foreground.rotation[2]+0.02,0)
  
  --g3d.camera.lookAt(0,0,1,1,math.sin(timer)/6,math.sin(timer/2)/6)
  --g3d.camera.firstPersonMovement(dt)
end

function drawFloor(f)
  f.model1:draw()
  f.model2:draw()
  f.fade:draw()
  f.black:draw()
end

function drawBG()
  love.graphics.setColor(1,1,1,1)
  drawFloor(floor)
  drawFloor(floor2)
  for i,v in ipairs(pillars) do
    local fade = 1 - v.pos/10
    fade = fade - 0.2 -- additional darkening
    if fade < 0 then fade = 0 end
    love.graphics.setColor(fade,fade,fade)
    v.model1:draw()
    v.model2:draw()
  end
end

function drawFG()
  --love.graphics.setColor(1,1,1,0.25)
  --foreground:draw()
  love.graphics.setColor(0,0.1,0.6,0.2)
  love.graphics.rectangle("fill",0,0,SCREENWIDTH,SCREENHEIGHT)
end
