#pragma once

#ifdef MT_PLATFORM_WINDOWS
	#ifdef MT_BUILD_DLL
		#define MTENGINE_API __declspec(dllexport)
	#else
		#define MTENGINE_API __declspec(dllimport)
	#endif
#else
	#error MTEngine only support windows!
#endif

#define BIT(x) (1 << x)
