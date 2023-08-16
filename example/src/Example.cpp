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
		MT_INFO("ExampleLayer::Update");
	}

	void OnEvent(MTEngine::Event& event) override
	{
		MT_TRACE("{0}", event);
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