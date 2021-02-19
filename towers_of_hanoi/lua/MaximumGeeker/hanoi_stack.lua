--[[ Towers of hanoi - Lua 5.1 ]]--

local leftStack, centerStack, rightStack = {name = 'Left'}, {name = 'Center'}, {name = 'Right'}

local visualize = function(...)
  local z = {...}

  for i = 1, 3 do
    print(string.format("%s:\t%s", z[i].name, table.concat(z[i], ' ')))
  end
  print()
end

local move = function(a, b)
  print( a.name, '->', b.name )
  table.insert( b, table.remove(a) )

  coroutine.yield(true)
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
local n = tonumber( io.read "*l", 10 )

if type(n) == 'number' then
  n = math.floor(n)
else
  io.stderr "Value given is not a number.\n"
  os.exit(1)
end

for i = n, 1, -1 do
  leftStack[ #leftStack+1 ] = i
end

local hanoiInteractive = coroutine.wrap(hanoi)
local counter = 0

repeat
  print('#'..counter..': ')
  counter = counter + 1
  visualize( leftStack, centerStack, rightStack )
  io.read()
until hanoiInteractive(n, leftStack, centerStack, rightStack) ~= true
