# Autogenerated wrapper script for Xorg_libXmu_jll for armv7l-linux-gnueabihf
export libXmuu, libXmu

using Xorg_libXext_jll
using Xorg_libXt_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libXmuu`
const libXmuu_splitpath = ["lib", "libXmuu.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libXmuu_path = ""

# libXmuu-specific global declaration
# This will be filled out by __init__()
libXmuu_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libXmuu = "libXmuu.so.1"


# Relative path to `libXmu`
const libXmu_splitpath = ["lib", "libXmu.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libXmu_path = ""

# libXmu-specific global declaration
# This will be filled out by __init__()
libXmu_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libXmu = "libXmu.so.6"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Xorg_libXmu")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Xorg_libXext_jll.PATH_list, Xorg_libXt_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Xorg_libXext_jll.LIBPATH_list, Xorg_libXt_jll.LIBPATH_list,))

    global libXmuu_path = normpath(joinpath(artifact_dir, libXmuu_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libXmuu_handle = dlopen(libXmuu_path)
    push!(LIBPATH_list, dirname(libXmuu_path))

    global libXmu_path = normpath(joinpath(artifact_dir, libXmu_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libXmu_handle = dlopen(libXmu_path)
    push!(LIBPATH_list, dirname(libXmu_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

