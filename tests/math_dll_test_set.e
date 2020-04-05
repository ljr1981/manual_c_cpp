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
		note
			basis: "[
				The {WRAPP_MATH_DLL} class is the basis for this test.
				Please see all of the notes at the top of that class
				for a guide on how the DLL external works. The class
				and its notes are there to demonstrate wrapping of the
				C-code. This class merely demonstrates consuming that
				class and that the code works as intended (reaching its
				goal and purpose).
				]"
		local
			l_item: WRAP_MATH_DLL
			l_current: REAL_64
			l_index: INTEGER_32
		do
			from
				create l_item.make (1, 1)
			until
				not l_item.next_value
			loop
				l_current := l_item.current_value
				l_index := l_item.index
				print (l_current.out + " " + (l_index + 1).out + "%N")
			end
			assert_not_equal ("current", "0", l_current.out)
			assert_integers_equal ("index", 92, l_index)
		end

end


