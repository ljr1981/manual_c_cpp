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

feature -- Wrapping DLL

	fibonacci_initialization (a, b: DOUBLE)
			-- Encapsulation of a dll function with the `_stdcall' call mechanism.
			-- Initialize a Fibonacci relation sequence
			-- such that F(0) = a, F(1) = b.
			-- This function must be called before any other function.
		external
			"C [dllwin32 %"MathLibrary.dll%"] (long, long)"
		alias
			"fibonacci_init"
		end

	fibonacci_index: INTEGER
		external
			"C [dllwin32 %"MathLibrary.dll%"]: int"
		end

	fibonacci_current: DOUBLE
		external
			"C [dllwin32 %"MathLibrary.dll%"]: long"
		end

	fibonacci_next: BOOLEAN
		external
			"C [dllwin32 %"MathLibrary.dll%"]: bool"
		end

end
