#pragma once


#ifdef MT_PLATFORM_WINDOWS

extern MTEngine::Application* MTEngine::CreateApplication();

int main(int argc, char** argv) {
	printf("MT Engine");
	auto app = MTEngine::CreateApplication();
	app->run();
	delete app;
}

#endif
