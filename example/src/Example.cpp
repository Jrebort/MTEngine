#include <MTEngine.h>

class Example : public MTEngine::Application
{
public:
	Example() {
		MTEngine::Log::GetClientLogger()->info("Example Setup!");
	}
	~Example() {
	}	
};

MTEngine::Application* MTEngine::CreateApplication() {
	return new Example();
}