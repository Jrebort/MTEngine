workspace "MTEngine"
architecture "x64"

configurations{
	"Debug",
	"Release",
	"Dist",
}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "MTEngine"
	location "MTEngine"
	kind "SharedLib"
	language "C++" 

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs{
		"%{prj.name}/vendor/spdlog/include";
	}

	filter "system:windows"
		cppdialect "c++17"
		staticruntime "on"
		systemversion "10.0.22000.0"


		defines{
			"MT_PLATFORM_WINDOWS",
			"MT_BUILD_DLL"
		}

		postbuildcommands{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Example")
		}

	filter "configurations:Debug"
		defines "MT_DEBUG"
		symbols "on"


	filter "configurations:Release"
		defines "MT_RELEASE"
		symbols "on"


	filter "configurations:Dist"
		defines "MT_DIST"
		symbols "on"
	

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
		"MTEngine/vendor/spdlog/include",
		"MTEngine/src"
	}

	links{
		"MTEngine"
	}

	filter "system:windows"
		cppdialect "c++17"
		staticruntime "on"
		systemversion "10.0.22000.0"

		defines{
			"MT_PLATFORM_WINDOWS",
		}

	filter "configurations:Debug"
		defines "MT_DEBUG"
		symbols "on"


	filter "configurations:Release"
		defines "MT_RELEASE"
		symbols "on"


	filter "configurations:Dist"
		defines "MT_DIST"
		symbols "on"
	