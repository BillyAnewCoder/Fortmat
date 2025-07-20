
-- Comprehensive test file for luau-format
-- Tests various AST/expression combinations to ensure output can be parsed

-- Basic expressions
local a = 1
local b = "hello"
local c = true
local d = nil

-- Binary operations
local sum = 1 + 2
local diff = 10 - 5
local mult = 3 * 4
local div = 8 / 2
local mod = 7 % 3
local pow = 2 ^ 3
local concat = "hello" .. "world"

-- Comparison operations
local eq = 1 == 1
local neq = 1 ~= 2
local lt = 1 < 2
local lte = 1 <= 1
local gt = 2 > 1
local gte = 2 >= 2

-- Logical operations
local and_op = true and false
local or_op = true or false
local not_op = not true

-- Unary operations
local neg = -5
local len = #"hello"
local not_val = not false

-- Complex expressions with grouping
local complex1 = (1 + 2) * (3 - 1)
local complex2 = not (a == b)
local complex3 = (true and false) or (not true)

-- Table constructors
local empty_table = {}
local list_table = {1, 2, 3, "hello", true}
local record_table = {x = 10, y = 20, name = "test"}
local mixed_table = {1, 2, x = 10, [true] = "boolean_key"}

-- Function expressions
local simple_func = function() return 1 end
local param_func = function(x, y) return x + y end
local vararg_func = function(...) return ... end

-- Call expressions
local result1 = simple_func()
local result2 = param_func(1, 2)
local result3 = vararg_func(1, 2, 3)

-- Index expressions
local index1 = record_table.x
local index2 = record_table["name"]
local index3 = list_table[1]

-- Control flow statements
if a == 1 then
    print("a is 1")
elseif a == 2 then
    print("a is 2")
else
    print("a is something else")
end

while a < 10 do
    a = a + 1
end

repeat
    a = a - 1
until a == 0

for i = 1, 10 do
    print(i)
end

for key, value in pairs(record_table) do
    print(key, value)
end

-- Function definitions
function global_func()
    return "global"
end

local function local_func(param)
    return param * 2
end

-- Nested expressions that test grouping
local nested1 = ((1 + 2) * 3) + ((4 - 1) / 2)
local nested2 = not (not (true and false))
local nested3 = (function() return 1 end)() + (function() return 2 end)()

-- Edge cases for expression grouping
local group_test1 = (1)
local group_test2 = ((1))
local group_test3 = (((1 + 2)))

-- String interpolation (if supported)
local name = "world"
local greeting = `Hello, {name}!`
local complex_interp = `Result: {1 + 2 * 3}`

-- Return statements
function test_returns()
    return 1, 2, 3
end

function conditional_return()
    if true then
        return "early"
    end
    return "late"
end
