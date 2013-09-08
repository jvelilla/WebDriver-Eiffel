note
	description: "Summary description for {SE_OS_VALUE_JSON_CONVERTER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SE_OS_VALUE_JSON_CONVERTER
inherit
	SE_JSON_CONVERTER

create
	make

feature {NONE} -- Initialization

	make
		do
			create object.make_empty
		end

feature -- Access

	object: SE_OS_VALUE

feature -- Conversion

	from_json (j: like to_json): detachable like object
		do
			create Result.make_empty
			if attached {STRING_32} json_to_object (j.item (version_key), Void) as l_item then
				Result.set_version(l_item)
			end
			if attached {STRING_32} json_to_object (j.item (name_key), Void) as l_item then
				Result.set_name(l_item)
			end
			if attached {STRING_32} json_to_object (j.item (architecture_key), Void) as l_item then
				Result.set_architecture(l_item)
			end



		end

	to_json (o: like object): JSON_OBJECT
		do
			create Result.make
			Result.put (json.value (o.architecture), architecture_key)
			Result.put (json.value (o.name), name_key)
			Result.put (json.value (o.version), version_key)
		end

feature {NONE} -- Implementation



	version_key: JSON_STRING
		once
			create Result.make_json ("version")
		end

	name_key: JSON_STRING
		once
			create Result.make_json ("name")
		end

	architecture_key: JSON_STRING
		once
			create Result.make_json ("arch")
		end


end
