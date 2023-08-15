#include "mtpch.h"
#include "Application.h"

#include "MTEngine/Events/ApplicationEvent.h"
#include "MTEngine/Log.h"

namespace MTEngine {
	Application::Application() {
		m_Window = std::unique_ptr<Window>(Window::Create());
	}

	Application::~Application() {

	}

	void Application::run() {
		while(true){
			m_Window->OnUpdate();
		}
	}
}
