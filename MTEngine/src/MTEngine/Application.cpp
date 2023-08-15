#include "mtpch.h"
#include "Application.h"

#include "MTEngine/Events/ApplicationEvent.h"
#include "MTEngine/Log.h"

#include <GLFW/glfw3.h>

namespace MTEngine {
	Application::Application() {
		m_Window = std::unique_ptr<Window>(Window::Create());
	}

	Application::~Application() {

	}

	void Application::run() {
		while(m_Running){
			glClearColor(1, 0, 1, 1);
			glClear(GL_COLOR_BUFFER_BIT);
			m_Window->OnUpdate();
		}
	}
}
