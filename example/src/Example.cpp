#include <MTEngine.h>

class Example : public MTEngine::Application
{
public:
	Example() {
	}
	~Example() {
	}	
};

MTEngine::Application* MTEngine::CreateApplication() {
	return new Example();
}