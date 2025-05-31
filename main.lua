lick = require("lick.lick")
lick.reset = true

function love.load()
  xMax, yMax = love.window.getMode()
  x = xMax
  y = yMax / 2

  notes = {}
  local lastX = x
  for i=0,100 do
    local variant = "don"
    if love.math.random() < 0.5 then
      variant = "ka"
    end

    local size = "little"
    if love.math.random() < 0.2 then
      size = "big"
    end

    table.insert(notes, {
      x=(10 * x - i * xMax / 10),
      y=y,
      variant=variant,
      size=size,
    })
  end

  love.graphics.setBackgroundColor(.1,.1,.1)
end

function love.update(dt)
  for i, n in pairs(notes) do
    n.x = n.x - 200 * dt
  end
end

function love.draw()
  -- Draw taiko board
  love.graphics.setColor(1.0, 1.0, .5)
  love.graphics.rectangle("fill", 0, y - 60, xMax, 10)
  love.graphics.setColor(1.0, 1.0, 1.0)
  love.graphics.rectangle("fill", 0, y - 50, xMax, 100)
  love.graphics.setColor(1.0, 1.0, .5)
  love.graphics.rectangle("fill", 0, y + 50, xMax, 10)

  -- Draw hit circle
  love.graphics.setColor(.0, .0, .0)
  love.graphics.circle("line", 60, yMax / 2, 22)

  -- Draw notes
  for _, n in pairs(notes) do
    note(n.variant, n.size, n.x, n.y)
  end
end

function note(variant, size, x, y)
  local color = {1.0, 0.2, 0.1}
  local radius = 10

  if variant == "ka" then
    color = {.0, 0.6, .9}
  end

  if size == "big" then
    radius = 20
  end

  love.graphics.setColor(unpack(color))
  love.graphics.circle("line", x, y, radius+2)
  love.graphics.circle("fill", x, y, radius)
end
