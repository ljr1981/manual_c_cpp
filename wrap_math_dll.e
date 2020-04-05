note
	description: "Summary description for {WRAP_MATH_DLL}."
	goal: "[
		For the purpose of this tutorial-code, we wanted a DLL that was simple and
		end-to-end--that is--we wanted a DLL that we wrote and controlled in Visual Studio 2020
		and then wrapped the resulting DLL in Eiffel (this class).
		
		Because of this--we now have a DLL that we can make as complicated as we need to
		for the purpose of demonstrating simple-to-complex wrapping of C-code DLL functions
		in Eiffel features and then consuming those features in an Auto-test class. This
		allows us to demonstrate the process from stem-to-stern (C-to-wrapper-to-consumer).
		]"
	MSC_special_note: "[
		The Visual Studio 2020 C-code is NOT included in this GitHub Eiffel project.
		See the EIS link below for both a tutorial and location of the C-code, which is
		the basis for the MS WIndows DLL being demonstrated.
		]"
	EIS: "name=MSVC_Tutorial", "src=https://docs.microsoft.com/en-us/cpp/build/walkthrough-creating-and-using-a-dynamic-link-library-cpp?view=vs-2019"
	EIS: "name=Eiffel_docs_interfacing_with_dll", "src=https://www.eiffel.org/doc/solutions/Interfacing_with_DLLs"
	misc_notes: "[
		The DLL uses the C calling convention.
		]"
	compiling_notes: "[
		This code is being tested using a x64 Eiffel/MSC installation. Therefore, the
		DLL is also compiled in Visual Studio 2020 as x64. Obviously, these must match
		(i.e. 32-for-32 or 64-for-64).
		]"
	style_notes: "[
		Each function in the DLL is wrapped with the following ideas in mind:
		
		1. Give each Eiffel feature an Eiffel-ish name, using the "alias" keyword
			to reference the actual C-function name in the DLL.
		2. Use a note-clause "C_function_signature" to quickly communicate how
			the C code looks so the reader can reason about how the Eiffel wrapping
			of the function works with it.
		3. Add require and ensure contracts as needed. The C-code will not have
			Design-by-Contract, so we do our best to add it here, wrapping each
			manually-wrapped C call with appropriate contracts to raise the
			software quality factor bar to a level appropriate for Eiffel code.
		4. Finally--copy (if any) the C-function comments from the C-code and
			re-write them in more Eiffel-ish terms so our Eiffel user/reader
			can reason about the goal or purpose of the Eiffel/C-wrapped-function.
		]"

class
	WRAP_MATH_DLL

create
	make

feature {NONE} -- Initialization

	make (a, b: DOUBLE)
			-- Initialize with seeded values.
		do
			initialize (a, b)
			is_initialized := True
		ensure
			initialized: is_initialized
		end

feature {NONE} -- DLL Initialization

	initialize (a, b: DOUBLE)
			-- Encapsulation of a DLL function with the `_stdcall' call mechanism.
			-- `initialize' a Fibonacci relation sequence such that F(0) = a, F(1) = b.
			-- This function must be called before any other function.
		note
			C_function_signature: "[
				void fibonacci_init(
				    const unsigned long long a,
				    const unsigned long long b)
				]"
		require
			not_initialized: not is_initialized
		external
			"C [dllwin32 %"MathLibrary.dll%"] (long, long)"
		alias
			"fibonacci_init"
		end

feature -- Status Report

	is_initialized: BOOLEAN
			-- Current `is_initialized'?

feature -- Access

	index: INTEGER
			-- The current `index' position in the sequence.
		note
			C_function_signature: "[
				unsigned fibonacci_index()
				]"
		require
			initialized: is_initialized
		external
			"C [dllwin32 %"MathLibrary.dll%"]: int"
		alias
			"fibonacci_index"
		end

	current_value: DOUBLE
			-- The `current_value' in the sequence.
		note
			C_function_signature: "[
				unsigned long long fibonacci_current()
				]"
		require
			initialized: is_initialized
		external
			"C [dllwin32 %"MathLibrary.dll%"]: long"
		alias
			"fibonacci_current"
		end

feature -- Operations

	next_value: BOOLEAN
			-- Produce the `next_value' in the sequence.
			-- Returns true on success, false on overflow.
		note
			C_function_signature: "[
				bool fibonacci_next()
				]"
		require
			initialized: is_initialized
		external
			"C [dllwin32 %"MathLibrary.dll%"]: bool"
		alias
			"fibonacci_next"
		ensure
			incremented: Result implies (old index = (index - 1))
		end

end
