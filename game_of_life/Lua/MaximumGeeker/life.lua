
math.randomseed( os.time() )
math.random()
math.random()
math.random()

local w, h = 12, 12

local xmt = { __index = function() return 0 end }
local x = setmetatable({}, xmt)
local mt = { __index = function() return x end }
local g1, g2 = setmetatable({}, mt), setmetatable({}, mt)

for i = 1, h do
  g1[i], g2[i]= setmetatable({}, xmt), setmetatable({}, xmt)
  for j = 1, w do
    g1[i][j], g2[i][j] = math.random() > 0.5 and 1 or 0, 0
  end
end

for _ = 1, 100 do

  for i = 1, h do
    for j = 1, w do
      local b = g1[i][j]

      local c =
        g1[i-1][j-1] + g1[i-1][j] + g1[i-1][j+1] +
        g1[ i ][j-1] +      0     + g1[ i ][j+1] +
        g1[i+1][j-1] + g1[i+1][j] + g1[i+1][j+1]

      if b == 1 then
        if c >= 2 and c <= 3 then
          g2[i][j] = 1
        else
          g2[i][j] = 0
        end
      else
        if c == 3 then
          g2[i][j] = 1
        else
          g2[i][j] = 0
        end
      end

    end
  end

  g1, g2 = g2, g1

  for i = 1, h do
    for j = 1, w do
      io.write(g1[i][j] == 1 and 'X' or ' ')
    end
    print()
  end
  print(string.rep('-', w+2))
  io.read()

end

