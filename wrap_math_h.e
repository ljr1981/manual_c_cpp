note
	description: "Wrapping features of <math.h>"
	EIS: "name=interfacing_with_c_cpp", "src=https://www.eiffel.org/doc/solutions/Interfacing_with_C_and_C%%2B%%2B#Using_an_existing_C_function", "protocol=url"
	EIS: "name=math_header_description", "src=http://www.cplusplus.com/reference/cmath/"
	discussion: "[
		Every feature of this class has been manually wrapped by hand.
		]"
	more: "See the End-of-class note clause for more."

class
	WRAP_MATH_H

feature -- External C Calls

	floor (v: DOUBLE): DOUBLE
			-- Floor of `v'
		note
			see_also: "End of class notes"
		external
			"[
				C signature (double): double use <math.h>
				]"
		end

	ceiling (v: DOUBLE): DOUBLE
			-- Ceiling of `v`
		note
			changes: "[
				Unlike `floor' above, the `ceiling' feature has two distinct differences.
				
				1. The `external' signature is in a "manifest-string" rather than "verbatim-string"
				2. The name of the function in <math.h> is `ceil', but we want to use the
					longer and more meaningful word "ceiling", so we call the Eiffel feature
					"ceiling" and link it to the "ceil" feature name in <math.h> by use of
					the "alias" keyword.
				3. The notation "(double): double" means `v' is passed in as (double) and
					": double" is our Result DOUBLE coming back.
				4. The "use <math.h>" tells our compiler where to look for the "alias" function
					called "ceil".
				]"
		external
			"C signature (double): double use <math.h>"
		alias
			"ceil"
		end

feature -- External C in-line

	my_floor (v: DOUBLE): DOUBLE
			-- Floor of `v'
		note
			tutorial: "[
				Here is a simple in-line version.
				Note the simple "external" signature and a passing of a reference to 
				the Eiffel argument `v'
				]"
			more: "[
				In the alias part you see a line of C code calling the library function 
				floor and returning the result. The argument to the call to floor needs 
				to be the argument to the Eiffel function my_floor. To do this in the inline 
				C code, the dollar sign ('$') precedes the argument name "v". So, the 
				convention in inline externals is to use the dollar sign in C or C++ 
				code to reference an argument of the Eiffel function.
				]"
		external
			"C inline use <math.h>"
		alias
			"return floor($v)"
		end

note
	tutorial: "[
		Here is an example of an external targeting an existing C function. 
		In this case it's the floor function from the C library.
		]"
	ecma_367: "8.31 Interfacing with C, C++ and other environments"
	bnfe: "[
		8.31.1 Syntax: External routines
			External =Δ external External_language [External_name]
			External_language =Δ Unregistered_language | Registered_language

			------------------- Informative text ---------------------
			Registered_language: every Eiffel compiler must support the
			language names "C", "C++" and dll.

		8.31.4 Syntax: External signatures
			External_signature =Δ signature [External_argument_types] [: External_type]
			External_argument_types =Δ "(" External_type_list ")"
			External_type_list =Δ {External_type "," …}*
			External_type =Δ Simple_string

		8.31.7 Syntax: External file use
			External_file_use =Δ use External_file_list
			External_file_list =Δ {External_file "," …}+
			External_file =Δ External_user_file | External_system_file
			External_user_file =Δ ' " ' Simple_string ' " '
			External_system_file =Δ "<"Simple_string ">"

		THEREFORE:
		==========
		External_keyword:								external
		External_language:								C
		External_signature:								signature
		["(" External_type_list ")"][: External_type]	(double): double
		External_file_use_keyword:						use
		External_file_list:								<math.h>

		------------------- Informative text ---------------------
		The feature content below is therefore described just above.
		Instead of a "do .. end", we have an "external .. end" block.
		Within this block, we have a simple string consisting a specification
		about an extern function in <math.h> called `floor'.

		The terms "signature" and "use" within the quoted string are technically
		not Eiffel language keywords, but are keywords used in the specification
		of externals.

		NOTE: We can put the external specification in either a `manifest-string'
		or in a `verbatim-string' (demonstrated below).
		]"

end
