lick = require("lick.lick")
lick.reset = true

function love.load()
  rnd = .0
  xMax, yMax = love.window.getMode()

  love.graphics.setNewFont(35)
  love.graphics.setBackgroundColor(.1,.1,.1)
end

function love.update(dt)
  rnd = love.math.random()
end

function love.draw()
  for i=1,10 do
    mode = "line"
    if love.math.random() < 0.9 then
      mode = "fill"
    end

    segments = 5

    x = love.math.random(xMax)
    y = love.math.random(yMax)
    size = love.math.random(160)

    love.graphics.rotate(rnd)
    love.graphics.setColor(
      love.math.random(),
      love.math.random(),
      love.math.random()
    )
    love.graphics.circle(mode, x, y, size, segments)
  end
  love.timer.sleep(0.5)
end
