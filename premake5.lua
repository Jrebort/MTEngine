workspace "MTEngine"
architecture "x64"

configurations{
	"Debug",
	"Release",
	"Dist",
}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "MTEngine/vendor/glfw/include"
IncludeDir["Glad"] = "MTEngine/vendor/glad/include"

include "MTEngine/vendor/glfw"
include "MTEngine/vendor/glad"

project "Example"
	location "example"	
	kind "ConsoleApp"

	language "C++"


	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs{
		"MTEngine/src",
		"MTEngine/vendor/spdlog/include",
	}

	links{
		"MTEngine",
	}

	filter "system:windows"
		cppdialect "c++17"
		staticruntime "on"
		systemversion "latest"

		defines{
			"MT_PLATFORM_WINDOWS",
		}

	filter "configurations:Debug"
		defines "MT_DEBUG"
		buildoptions "/MDd"
		symbols "on"


	filter "configurations:Release"
		defines "MT_RELEASE"
		buildoptions "/MD"
		symbols "on"


	filter "configurations:Dist"
		defines "MT_DIST"
		buildoptions "/MD"
		symbols "on"
	

project "MTEngine"
	location "MTEngine"
	kind "SharedLib"
	language "C++" 

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "mtpch.h"
	pchsource "MTEngine/src/mtpch.cpp"

	files{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}"
	}

	links{
		"GLFW",
		"Glad",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "c++17"
		staticruntime "on"
		systemversion "latest"


		defines{
			"MT_PLATFORM_WINDOWS",
			"MT_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}
		
		postbuildcommands{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Example")
		}

	filter "configurations:Debug"
		defines "MT_DEBUG"
		buildoptions "/MDd"
		symbols "on"


	filter "configurations:Release"
		defines "MT_RELEASE"
		buildoptions "/MD"
		symbols "on"


	filter "configurations:Dist"
		defines "MT_DIST"
		buildoptions "/MD"
		symbols "on"