note
	description: "Provides coordinates of an element for advanced interactions"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SE_COORDINATES

inherit

	REFACTORING_HELPER

create
	make

feature {NONE} -- Initialization

	make ( a_web_driver : like driver)
			-- Create an object se_mouse with his driver
		do
			driver := a_web_driver
		ensure
			web_driver_set : driver = a_web_driver
		end


feature -- Access

	on_screen: detachable SE_POINT
		do
			to_implement ("Not supported yet.")
		end

	in_view_port: detachable SE_POINT
		do
			if attached driver.active_element as l_element and then
				attached driver.session  as l_session then
				Result := driver.api.location_in_view (l_session.session_id, l_element.element)
			end
		end

	on_page: detachable SE_POINT
		do
			if attached driver.active_element as l_element and then
				attached driver.session  as l_session then
				Result := driver.api.element_location (l_session.session_id, l_element.element)
			end
		end

	auxiliary: detachable ANY
		do
			if attached driver.active_element as l_element then
				Result := l_element.element
			end
		end


feature -- {NONE} -- Implementations
	driver : WEB_DRIVER
		-- web_driver

end