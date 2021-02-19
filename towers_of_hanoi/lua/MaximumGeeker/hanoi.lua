--[[ Towers of hanoi - Lua 5.1 ]]--

local move = function(a, b)
  print( a, '->', b )
end

local hanoi
hanoi = function(n, orig, pivot, dest)
  if n < 1 then
    return
  end

  if n == 1 then
    move( orig, dest )
    return
  end

  if n == 2 then
    move( orig, pivot )
    move( orig, dest )
    move( pivot, dest )
    return
  end

  hanoi(n-2, orig, pivot, dest)
  move( orig, pivot )
  hanoi(n-2, dest, orig, pivot)
  move( orig, dest )
  hanoi(n-1, pivot, orig, dest)
end

io.write "Value of N: "
local n = io.read "*n"

if type(n) == 'number' then
  n = math.floor(n)
else
  io.stderr "Value given is not a number.\n"
  os.exit(1)
end

hanoi(n, 'Left', 'Center', 'Right')
