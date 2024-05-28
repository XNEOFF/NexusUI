Uses:

function parent:AddLabel(option)
		option = typeof(option) == "table" and option or {}
		option.text = tostring(option.text)
		option.type = "label"
		option.position = #self.options
		table.insert(self.options, option)
		
		return option
	end
	
	function parent:AddToggle(option)
		option = typeof(option) == "table" and option or {}
		option.text = tostring(option.text)
		option.state = typeof(option.state) == "boolean" and option.state or false
		option.callback = typeof(option.callback) == "function" and option.callback or function() end
		option.type = "toggle"
		option.position = #self.options
		option.flag = option.flag or option.text
		library.flags[option.flag] = option.state
		table.insert(self.options, option)
		
		return option
	end
	
	function parent:AddButton(option)
		option = typeof(option) == "table" and option or {}
		option.text = tostring(option.text)
		option.callback = typeof(option.callback) == "function" and option.callback or function() end
		option.type = "button"
		option.position = #self.options
		option.flag = option.flag or option.text
		table.insert(self.options, option)
		
		return option
	end
	
	function parent:AddBind(option)
		option = typeof(option) == "table" and option or {}
		option.text = tostring(option.text)
		option.key = (option.key and option.key.Name) or option.key or "F"
		option.hold = typeof(option.hold) == "boolean" and option.hold or false
		option.callback = typeof(option.callback) == "function" and option.callback or function() end
		option.type = "bind"
		option.position = #self.options
		option.flag = option.flag or option.text
		library.flags[option.flag] = option.key
		table.insert(self.options, option)
		
		return option
	end
	
	function parent:AddSlider(option)
		option = typeof(option) == "table" and option or {}
		option.text = tostring(option.text)
		option.min = typeof(option.min) == "number" and option.min or 0
		option.max = typeof(option.max) == "number" and option.max or 0
		option.dual = typeof(option.dual) == "boolean" and option.dual or false
		option.value = math.clamp(typeof(option.value) == "number" and option.value or option.min, option.min, option.max)
		option.value2 = typeof(option.value2) == "number" and option.value2 or option.max
		option.callback = typeof(option.callback) == "function" and option.callback or function() end
		option.float = typeof(option.value) == "number" and option.float or 1
		option.type = "slider"
		option.position = #self.options
		option.flag = option.flag or option.text
		library.flags[option.flag] = option.value
		table.insert(self.options, option)
		
		return option
	end
	
	function parent:AddList(option)
		option = typeof(option) == "table" and option or {}
		option.text = tostring(option.text)
		option.values = typeof(option.values) == "table" and option.values or {}
		option.value = tostring(option.value or option.values[1] or "")
		option.callback = typeof(option.callback) == "function" and option.callback or function() end
		option.open = false
		option.type = "list"
		option.position = #self.options
		option.flag = option.flag or option.text
		library.flags[option.flag] = option.value
		table.insert(self.options, option)
		
		return option
	end
	
	function parent:AddBox(option)
		option = typeof(option) == "table" and option or {}
		option.text = tostring(option.text)
		option.value = tostring(option.value or "")
		option.callback = typeof(option.callback) == "function" and option.callback or function() end
		option.type = "box"
		option.position = #self.options
		option.flag = option.flag or option.text
		library.flags[option.flag] = option.value
		table.insert(self.options, option)
		
		return option
	end
	
	function parent:AddColor(option)
		option = typeof(option) == "table" and option or {}
		option.text = tostring(option.text)
		option.color = typeof(option.color) == "table" and Color3.new(tonumber(option.color[1]), tonumber(option.color[2]), tonumber(option.color[3])) or option.color or Color3.new(255, 255, 255)
		option.callback = typeof(option.callback) == "function" and option.callback or function() end
		option.open = false
		option.type = "color"
		option.position = #self.options
		option.flag = option.flag or option.text
		library.flags[option.flag] = option.color
		table.insert(self.options, option)
		
		return option
	end
	
	function parent:AddFolder(title)
		local option = {}
		option.title = tostring(title)
		option.options = {}
		option.open = false
		option.type = "folder"
		option.position = #self.options
		table.insert(self.options, option)
		
		getFnctions(option)
		
		function option:init()
			createOptionHolder(self.title, parent.content, self, true)
			loadOptions(self, parent)
		end
		
		return option
	end
_________________________________________________________________
Explain Uses:

This Lua script defines several functions within a `parent` object. These functions are used to add different types of UI elements to a window. Here's a breakdown of each function:

1. `parent:AddLabel(option)`: Adds a label to the window. It takes a table `option` as an argument, where `option.text` represents the text of the label.

2. `parent:AddToggle(option)`: Adds a toggle button to the window. It takes a table `option` as an argument, where `option.text` represents the text displayed next to the toggle button, `option.state` represents the initial state of the toggle (true/false), and `option.callback` represents the function to be called when the toggle state changes.

3. `parent:AddButton(option)`: Adds a button to the window. It takes a table `option` as an argument, where `option.text` represents the text displayed on the button, and `option.callback` represents the function to be called when the button is clicked.

4. `parent:AddBind(option)`: Adds a key bind to the window. It takes a table `option` as an argument, where `option.text` represents the text displayed next to the key bind, `option.key` represents the key to be bound, `option.hold` represents whether the key should be held down, and `option.callback` represents the function to be called when the key is pressed.

5. `parent:AddSlider(option)`: Adds a slider to the window. It takes a table `option` as an argument, where `option.text` represents the text displayed next to the slider, `option.min` and `option.max` represent the minimum and maximum values of the slider, `option.value` represents the initial value of the slider, `option.callback` represents the function to be called when the slider value changes, and `option.float` represents the number of decimal places to display.

6. `parent:AddList(option)`: Adds a list to the window. It takes a table `option` as an argument, where `option.text` represents the text displayed next to the list, `option.values` represents the list of values to choose from, `option.value` represents the initial selected value, and `option.callback` represents the function to be called when a value is selected from the list.

7. `parent:AddBox(option)`: Adds a text box to the window. It takes a table `option` as an argument, where `option.text` represents the text displayed next to the text box, and `option.value` represents the initial value of the text box.

8. `parent:AddColor(option)`: Adds a color picker to the window. It takes a table `option` as an argument, where `option.text` represents the text displayed next to the color picker, `option.color` represents the initial color, and `option.callback` represents the function to be called when the color is changed.

9. `parent:AddFolder(title)`: Adds a folder to the window. It takes a string `title` as an argument, representing the title of the folder. This function returns a table representing the folder, which can then be initialized to add options within the folder.

Note: This Lua script provides functionality to enhance a window by allowing the addition of various UI elements through specific functions. Here's a simplified breakdown:

- **Parent**: Represents a window where UI elements are added.
- **Add--**: Refers to functions like `AddToggle`, `AddButton`, etc., used to add specific UI elements.
- **Option**: A table containing properties for configuring the UI element.
- **Option.Text**: A mandatory property within the `Option` table, specifying the display text for the UI element.
_________________________________________________________________