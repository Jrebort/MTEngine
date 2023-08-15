#include <MTEngine.h>

class Example : public MTEngine::Application
{
public:
	Example() {
		MT_INFO("Example Setup!");
	}
	~Example() {
	}	
};

MTEngine::Application* MTEngine::CreateApplication() {
	return new Example();
}