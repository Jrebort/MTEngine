#pragma once

#ifdef MT_PLATFORM_WINDOWS
#if MT_DYNAMIC_LINK
	#ifdef MT_BUILD_DLL
		#define MTENGINE_API __declspec(dllexport)
	#else
		#define MTENGINE_API __declspec(dllimport)
	#endif
#else
	#define MTENGINE_API
#endif
#else
	#error MTEngine only support windows!
#endif

#ifdef MT_DEBUG
#define MT_ENABLE_ASSERTS
#endif

#ifdef MT_ENABLE_ASSERTS
	#define MT_ASSERT(x, ...) { if(!(x)) { MT_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define MT_CORE_ASSERT(x, ...) { if(!(x)) { MT_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define MT_ASSERT(x, ...)
	#define MT_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

#define MT_BIND_EVENT_FN(fn) [this](auto&&... args) -> decltype(auto) { return this->fn(std::forward<decltype(args)>(args)...); }
