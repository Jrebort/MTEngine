#pragma once

#include "MTEngine/Layer.h"

#include "MTEngine/Events/ApplicationEvent.h"
#include "MTEngine/Events/KeyEvent.h"
#include "MTEngine/Events/MouseEvent.h"
namespace MTEngine {

	class MTENGINE_API ImGuiLayer : public Layer
	{
	public:
		ImGuiLayer();
		~ImGuiLayer();

		virtual void OnAttach() override;
		virtual void OnDetach() override;
		virtual void OnImGuiRender() override;

		void Begin();
		void End();
	private:
		float m_Time = 0.0f;
	};

}
