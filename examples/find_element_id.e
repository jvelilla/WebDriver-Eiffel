note
	description: "Using the id attribute is the most preferable way to locate elements on a page."

class
	FIND_ELEMENT_ID

inherit

	ANY
		redefine
			default_create
		end

create
	default_create

feature

	default_create
		do
			search
		end

feature -- Search by id

	search
		local
			web_driver: WEB_DRIVER
			wait: WEB_DRIVER_WAIT
			l_rect: SE_RECTANGLE
			l_point: SE_POINT
			l_dim: SE_DIMENSION
		do
				--Create a new instance of a Web driver
			create web_driver.make

				-- Start session with chrome
			web_driver.start_session_chrome
			web_driver.window_maximize

				-- Go to EiffelRoom login page
			web_driver.to_url ("http://www.eiffel.org")

				-- Find the built-in with Eiffel secction by id.
				-- Get the Rectangle.
			if attached {WEB_ELEMENT} web_driver.find_element ((create {SE_BY}).id ("built-with-eiffel")) as l_section then
				l_rect := l_section.get_rect
				l_point := l_section.get_location
				l_dim := l_section.get_size
				check  expected_same_x_and_y_values:  l_rect.x = l_point.x and then l_rect.y = l_point.y end
				check  expected_same_width_and_height_values: l_rect.width= l_dim.width and then l_rect.height = l_dim.height end
			end


			io.read_line
				-- close the window
			web_driver.window_close
		end

end
