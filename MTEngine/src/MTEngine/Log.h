#pragma once

#include "Core.h"
#include <spdlog/spdlog.h>
#include <spdlog/sinks/stdout_color_sinks.h>

namespace MTEngine {

	class MTENGINE_API Log
	{
	public:
		static void init();
		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; };
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; };
		 
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// Core log marcos
#define MT_CORE_TRACE(...)   ::MTEngine::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define MT_CORE_INFO(...)    ::MTEngine::Log::GetCoreLogger()->info(__VA_ARGS__)
#define MT_CORE_WARN(...)    ::MTEngine::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define MT_CORE_ERROR(...)   ::MTEngine::Log::GetCoreLogger()->error(__VA_ARGS__)
#define MT_CORE_FATAL(...)   ::MTEngine::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Core log marcos
#define MT_TRACE(...)        ::MTEngine::Log::GetClientLogger()->trace(__VA_ARGS__)
#define MT_INFO(...)         ::MTEngine::Log::GetClientLogger()->info(__VA_ARGS__)
#define MT_WARN(...)         ::MTEngine::Log::GetClientLogger()->warn(__VA_ARGS__)
#define MT_ERROR(...)        ::MTEngine::Log::GetClientLogger()->error(__VA_ARGS__)
#define MT_FATAL(...)        ::MTEngine::Log::GetClientLogger()->fatal(__VA_ARGS__)

