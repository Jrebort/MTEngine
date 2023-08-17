#include <MTEngine.h>

class ExampleLayer : public MTEngine::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
		//MT_INFO("ExampleLayer::Update");
		if (MTEngine::Input::IsKeyPressed(MT_KEY_TAB))
			MT_TRACE("Tab key is pressed (poll)!");
	}

	void OnEvent(MTEngine::Event& event) override
	{
		if (event.GetEventType() == MTEngine::EventType::KeyPressed)
		{
			
			MTEngine::KeyPressedEvent& e = (MTEngine::KeyPressedEvent&)event;
			if (e.GetKeyCode() == MT_KEY_TAB)
				MT_TRACE("Tab key is pressed (event)!");
			MT_TRACE("{0}", (char)e.GetKeyCode());
		}
	}

};

class Example : public MTEngine::Application
{
public:
	Example()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new MTEngine::ImGuiLayer());
	}

	~Example()
	{

	}

};

MTEngine::Application* MTEngine::CreateApplication() {
	return new Example();
}