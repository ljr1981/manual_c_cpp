note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	MATH_H_TEST_SET

inherit
	TEST_SET_SUPPORT

	TEST_SET_BRIDGE
		undefine
			default_create
		end

feature -- Test routines

	math_h_floor_test
			-- Tests of {WRAP_MATH_H}
		local
			l_item: WRAP_MATH_H
		do
			create l_item
			assert_equal ("math_h_floor", 3.0, l_item.floor (3.14))
			assert_equal ("math_h_ceiling", 4.0, l_item.ceiling (3.14))
			assert_32 ("math_h_floor_vs_my_floor", l_item.floor (3.14) = l_item.my_floor (3.14))
		end

end


