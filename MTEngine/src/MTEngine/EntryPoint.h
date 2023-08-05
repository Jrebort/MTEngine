#pragma once


#ifdef MT_PLATFORM_WINDOWS

extern MTEngine::Application* MTEngine::CreateApplication();

int main(int argc, char** argv) {

	MTEngine::Log::init();
	MTEngine::Log::GetCoreLogger()->warn("Initialized MTEngine!");

	auto app = MTEngine::CreateApplication();
	app->run();
	delete app;
}

#endif
