str = 'Input: "()"
Output: true
Example 2:

Input: "()[]{}"
Output: true
Example 3:

Input: "(]"
Output: false
Example 4:

Input: "([)]"
Output: false
Example 5:

Input: "{[]}"
Output: true'

def format_inputs(str, method_name)
  str.split("\n").reduce('') do |str, line|
    str += 'p ' + method_name + line[/(?<=Input:).+/] if line[/Input/]
    str += ' #' + line[/(?<=Output:).+/] + "\n" if line[/Output/]
    str
  end
end

puts format_inputs(str, "is_valid")