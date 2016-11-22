# Thanks for the template to Integralist at
# https://gist.github.com/Integralist/2862917
require "webrick"

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
    def do_GET (request, response)
      STDERR.puts request
      response.status = 200
      response.content_type = "text/plain"
      response.body = "Hello World\n"
    end
end

webserver = WEBrick::HTTPServer.new(:Port => 3000)
trap("INT") {
  webserver.shutdown
}
webserver.mount "", ""
webserver.start
