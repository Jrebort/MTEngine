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


project "Example"
	location "example"	
	kind "ConsoleApp"
	staticruntime "off"

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
		"MTEngine/vendor",
		"%{IncludeDir.glm}"
	}

	links{
		"MTEngine",
		"ImGui"
	}

	filter "system:windows"
		cppdialect "c++17"
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
	

project "MTEngine"
	location "MTEngine"
	kind "SharedLib"
	language "C++" 
	staticruntime "off"

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
		cppdialect "c++17"
		systemversion "latest"


		defines{
			"MT_PLATFORM_WINDOWS",
			"MT_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}
		
		postbuildcommands{
			("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Example/\"")
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