workspace "MTEngine"
architecture "x64"
startproject "Example"

configurations{
	"Debug",
	"Release",
	"Dist",
}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "MTEngine/vendor/glfw/include"
IncludeDir["Glad"] = "MTEngine/vendor/glad/include"
IncludeDir["ImGui"] = "MTEngine/vendor/imgui"
IncludeDir["glm"] = "MTEngine/vendor/glm"

include "MTEngine/vendor/glfw"
include "MTEngine/vendor/glad"
include "MTEngine/vendor/imgui"

project "MTEngine"
	location "MTEngine"
	kind "StaticLib"
	language "C++" 
	cppdialect "c++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "mtpch.h"
	pchsource "MTEngine/src/mtpch.cpp"

	files{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl",
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	includedirs{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}"
	}

	links{
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}

	filter "system:windows"
		systemversion "latest"


		defines{
			"MT_PLATFORM_WINDOWS",
			"MT_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}
		
	filter "configurations:Debug"
		defines "MT_DEBUG"
		runtime "Debug"
		symbols "on"


	filter "configurations:Release"
		defines "MT_RELEASE"
		runtime "Release"
		symbols "on"


	filter "configurations:Dist"
		defines "MT_DIST"
		runtime "Release"
		symbols "on"

project "Example"
	location "example"	
	kind "ConsoleApp"
	language "C++"
	cppdialect "c++17"
	staticruntime "on"


	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs{
		"MTEngine/src",
		"MTEngine/vendor/spdlog/include",
		"MTEngine/vendor",
		"%{IncludeDir.glm}"
	}

	links{
		"MTEngine",
	}

	filter "system:windows"
		systemversion "latest"

		defines{
			"MT_PLATFORM_WINDOWS",
		}

	filter "configurations:Debug"
		defines "MT_DEBUG"
		runtime "Debug"
		symbols "on"


	filter "configurations:Release"
		defines "MT_RELEASE"
		runtime "Release"
		symbols "on"


	filter "configurations:Dist"
		defines "MT_DIST"
		runtime "Release"
		symbols "on"