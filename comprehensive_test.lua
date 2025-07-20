
-- Comprehensive test file for Luau formatter
-- This file contains various AST/expression combinations to test formatting

-- Basic expressions
local nil_value = nil
local bool_true = true
local bool_false = false
local number = 42
local negative = -100
local string_literal = "hello world"
local string_with_quotes = 'single quotes'

-- Variables and globals
local local_var = x
global_var = y

-- Unary expressions
local not_expr = not true
local negative_expr = -42
local length_expr = #"string"

-- Binary expressions
local add = 1 + 2
local sub = 5 - 3
local mul = 3 * 4
local div = 8 / 2
local floor_div = 9 // 2
local mod = 10 % 3
local pow = 2 ^ 3
local concat = "hello" .. " world"
local eq = 1 == 1
local ne = 1 ~= 2
local lt = 1 < 2
local le = 1 <= 2
local gt = 2 > 1
local ge = 2 >= 1
local and_expr = true and false
local or_expr = true or false

-- Function calls
local call_no_args = func()
local call_with_args = func(1, 2, 3)
local call_nested = func(other_func(x))

-- Table constructors
local empty_table = {}
local list_table = {1, 2, 3}
local record_table = {x = 1, y = 2}
local mixed_table = {1, x = 2, [3] = 4}

-- Index expressions
local dot_index = table.field
local bracket_index = table["field"]
local computed_index = table[key]

-- Function expressions
local simple_func = function() end
local func_with_args = function(a, b) return a + b end
local func_with_varargs = function(...) return ... end

-- If expressions (ternary-like)
local if_expr = if condition then value1 else value2

-- Interpolated strings
local interp = `hello {name}!`
local complex_interp = `result: {func(x, y)} end`

-- Group expressions (parentheses)
local grouped = (1 + 2) * 3
local nested_groups = ((a + b) * (c + d))

-- Control flow statements
if condition then
    print("true")
elseif other_condition then
    print("elseif")
else
    print("false")
end

while condition do
    break
end

repeat
    continue
until condition

for i = 1, 10, 2 do
    print(i)
end

for key, value in pairs(table) do
    print(key, value)
end

-- Function declarations
function global_func(a, b)
    return a + b
end

local function local_func(x)
    local y = x * 2
    return y
end

-- Assignments
x = 1
x, y = 1, 2
table.field = value
table[key] = value
x += 1
y *= 2

-- Return statements
return
return value
return x, y, z

-- Complex nested expressions
local complex = func(
    table.field[index],
    (a + b) * (c - d),
    {
        nested = {
            deep = function(x)
                return if x > 0 then x else -x
            end
        }
    }
)
