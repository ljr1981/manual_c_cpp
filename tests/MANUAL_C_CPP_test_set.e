note
	description: "Tests of {MANUAL_C_CPP}."
	testing: "type/manual"

class
	MANUAL_C_CPP_TEST_SET

inherit
	TEST_SET_SUPPORT

	TEST_SET_BRIDGE
		undefine
			default_create
		end

feature -- Test routines

	MANUAL_C_CPP_tests
			-- `MANUAL_C_CPP_tests'
		do
			do_nothing -- yet ...
		end

end
