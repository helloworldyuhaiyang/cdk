#include "TimeHandler.h"
#include "Poco/Net/HTTPServerRequest.h"
#include "Poco/Net/HTTPServerResponse.h"
#include "Poco/Net/HTMLForm.h"


#include "Poco/DateTime.h"
#include "Poco/DateTimeFormatter.h"


void TimeHandler::handleRequest(Poco::Net::HTTPServerRequest& request, Poco::Net::HTTPServerResponse& response)
{
	response.setChunkedTransferEncoding(true);
	response.setContentType("text/html");

	Poco::Net::HTMLForm form(request, request.stream());
	std::ostream& responseStream = response.send();
	responseStream << "";
	responseStream << "\n";
	responseStream << "";
	responseStream << "\n";
	responseStream << "\n";
	responseStream << "";
#line 6 "/home/yhy/cpp_environment_setup/poco/v1.6.0/poco-1.6.0-all/PageCompiler/samples/HTTPTimeServer/src/TimeHandler.cpsp"

    Poco::DateTime now;
    std::string dt(Poco::DateTimeFormatter::format(now, "%W, %e %b %y %H:%M:%S %Z"));
	responseStream << "\n";
	responseStream << "<html>\n";
	responseStream << "<head>\n";
	responseStream << "<title>HTTPTimeServer powered by POCO C++ Libraries and PageCompiler</title>\n";
	responseStream << "<meta http-equiv=\"refresh\" content=\"1\">\n";
	responseStream << "</head>\n";
	responseStream << "<body>\n";
	responseStream << "<p style=\"text-align: center; font-size: 48px;\">";
#line 16 "/home/yhy/cpp_environment_setup/poco/v1.6.0/poco-1.6.0-all/PageCompiler/samples/HTTPTimeServer/src/TimeHandler.cpsp"
	responseStream << ( dt );
	responseStream << "</p>\n";
	responseStream << "</body>\n";
	responseStream << "</html>\n";
	responseStream << "";
}
