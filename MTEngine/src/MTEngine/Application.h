#pragma once

#include "Core.h"
#include "Events/Event.h"

namespace MTEngine {

	class MTENGINE_API Application
	{
	public:
		Application();
	 	virtual ~Application();

		void run();
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}
