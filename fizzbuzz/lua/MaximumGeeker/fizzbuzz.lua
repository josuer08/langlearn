--[[ FizzBuzz, Lua 5.1 ]]--

local ans = {
  'Fizz',
  'Buzz',
  'FizzBuzz'
}

for i = 1, 100 do
  local c = 0

  if i%3 == 0 then
    c = c + 1
  end

  if i%5 == 0 then
    c = c + 2
  end

  if ans[c] then
    print( i, ans[c] )
  end
end
