note
	description: "Object representing the dimensions and coordinates of a web element"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Element Rect ", "src=https://www.w3.org/TR/webdriver/#dfn-get-element-rect", "protocol=Uri"

class
	SE_RECTANGLE

create
	default_create,
	make_with_values,
	make_with_point_and_dimension


feature {NONE} -- Initialization

	make_with_values (a_x: INTEGER; a_y: INTEGER; a_height: NATURAL; a_width: NATURAL)
		do
			x := a_x
			y := a_y
			height := a_height
			width := a_width
		ensure
			x_set: x = a_x
			y_set: y = a_y
			height_set: height = a_height
			width_set: width = a_width
		end


	make_with_point_and_dimension (a_p: SE_POINT; a_d: SE_DIMENSION)
		do
			x := a_p.x
			y := a_p.y
			height := a_d.height
			width := a_d.width
		ensure
			x_set: x = a_p.x
			y_set: y = a_p.y
			height_set: height = a_d.height
			width_set: width = a_d.width
		end


feature -- Access

	x: INTEGER
    		-- X axis position of the top-left corner of the web element relative to the current browsing context’s document element in CSS pixels.

	y: INTEGER
	  	 	 -- Y axis position of the top-left corner of the web element relative to the current browsing context’s document element in CSS pixels.

	height: NATURAL
    		-- Height of the web element’s bounding rectangle in CSS pixels.

	width: NATURAL
    		-- Width of the web element’s bounding rectangle in CSS pixels.

    dimension: SE_DIMENSION
    		-- Rectangle's dimension.
    	do
    		create Result.make_with_values (width, height)
    	end

    point: SE_POINT
    		-- Rectangle's point.
    	do
    		create Result.make_with_values (x, y)
    	end

feature -- Change Element

	set_x (an_x : INTEGER)
			-- Set `x` to `an_x`.
		do
			x := an_x
		ensure
			x_set:  x = an_x
		end

	set_y (an_y : INTEGER)
			-- Set `y` to `an_y`.
		do
			y := an_y
		ensure
			y_set: y = an_y
		end

	set_width (a_width : NATURAL)
			--Set width to `a_width'
		do
			width := a_width
		ensure
			width_set : width = a_width
		end

	set_height (a_height : NATURAL)
			--Set height to `a_height'
		do
			height := a_height
		ensure
			height_set: height = a_height
		end

end
