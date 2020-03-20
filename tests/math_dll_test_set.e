note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	MATH_DLL_TEST_SET

inherit
	TEST_SET_SUPPORT

	TEST_SET_BRIDGE
		undefine
			default_create
		end

feature -- Test routines

	math_dll_fib_test
			-- `math_dll_fib_test' of DLL
		local
			l_item: WRAP_MATH_DLL
		do
			create l_item
			l_item.fibonacci_initialization (1, 1)
		end

end


