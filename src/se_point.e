note
	description: "Summary description for {SE_POINT}."
	date: "$Date$"
	revision: "$Revision$"

class
	SE_POINT

create
	default_create,
	make_with_values

feature -- Initialization

	make_with_values (new_x : INTEGER; new_y : INTEGER)
		do
			set_x (new_x)
			set_y (new_y)
		end

feature -- Access

	x : INTEGER
	y : INTEGER

		-- The X and Y coordinates for the element.

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
end
