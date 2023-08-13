#include "Application.h"

#include "MTEngine/Events/ApplicationEvent.h"
#include "MTEngine/Log.h"

namespace MTEngine {
	Application::Application() {
			
	}

	Application::~Application() {

	}

	void Application::run() {
		WindowResizeEvent e(1280, 720);
		MT_TRACE(e);
		while(true){}
	}
}
