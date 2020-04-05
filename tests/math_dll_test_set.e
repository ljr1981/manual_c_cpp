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
			l_current: REAL_64
			l_index: INTEGER_32
		do
			from
				create l_item.make (1, 1)
			until
				not l_item.fibonacci_next
			loop
				l_current := l_item.fibonacci_current
				l_index := l_item.fibonacci_index
				print (l_current.out + " " + (l_index + 1).out + "%N")
			end
			assert_not_equal ("current", "0", l_current.out)
			assert_integers_equal ("index", 92, l_index)
		end

end


