note
	description: "Summary description for {WRAP_MATH_DLL}."
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

class
	WRAP_MATH_DLL

create
	make

feature {NONE} -- Initialization

	make (a, b: DOUBLE)
			-- Initialize with seeded values.
		do
			fibonacci_initialization (a, b)
			is_initialized := True
		ensure
			initialized: is_initialized
		end

feature {NONE} -- DLL Initialization

	fibonacci_initialization (a, b: DOUBLE)
			-- Encapsulation of a DLL function with the `_stdcall' call mechanism.
			-- Initialize a Fibonacci relation sequence such that F(0) = a, F(1) = b.
			-- This function must be called before any other function.
		require
			not_initialized: not is_initialized
		external
			"C [dllwin32 %"MathLibrary.dll%"] (long, long)"
		alias
			"fibonacci_init"
		end

feature -- Status Report

	is_initialized: BOOLEAN

feature -- Access

	fibonacci_index: INTEGER
			-- The current index position in the sequence.
		require
			initialized: is_initialized
		external
			"C [dllwin32 %"MathLibrary.dll%"]: int"
		end

	fibonacci_current: DOUBLE
			-- The current value in the sequence.
		require
			initialized: is_initialized
		external
			"C [dllwin32 %"MathLibrary.dll%"]: long"
		end

feature -- Operations

	fibonacci_next: BOOLEAN
			-- Produce the next value in the sequence.
			-- Returns true on success, false on overflow.
		require
			initialized: is_initialized
		external
			"C [dllwin32 %"MathLibrary.dll%"]: bool"
		ensure
			incremented: Result implies (old fibonacci_index = (fibonacci_index - 1))
		end

end
