note
	description: "Summary description for {WRAP_MATH_DLL}."
	EIS: "name=MSVC_Tutorial", "src=https://docs.microsoft.com/en-us/cpp/build/walkthrough-creating-and-using-a-dynamic-link-library-cpp?view=vs-2019"
	EIS: "name=Eiffel_docs_interfacing_with_dll", "src=https://www.eiffel.org/doc/solutions/Interfacing_with_DLLs"
	misc_notes: "[
		The DLL uses the C calling convention.
		]"

class
	WRAP_MATH_DLL

inherit
	WEL_DLL
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			--<Precursor>
		require else
			not_loaded: item = default_pointer
		local
			l_dll_name: C_STRING
		do
			Precursor
			create l_dll_name.make ("MathLibrary.dll")
			item := cwin_permanent_load_library (l_dll_name.item)
		ensure then
			ensure_loaded: item /= default_pointer
		end

feature -- Wrapping DLL

	fibonacci_initialization (a, b: DOUBLE)
			-- Encapsulation of a dll function with the `_stdcall' call mechanism.
			-- Initialize a Fibonacci relation sequence
			-- such that F(0) = a, F(1) = b.
			-- This function must be called before any other function.
		require
			require_loaded: item /= default_pointer
		external
			"C [dllwin32 %"MathLibrary.dll%"] (long, long)"
		alias
			"fibonacci_init"
		end

end
