# Thanks for the template to Integralist at
# https://gist.github.com/Integralist/2862917
# See also https://ruby-doc.org/stdlib-2.0.0/libdoc/webrick/rdoc/WEBrick.html
require "webrick"

# Provide a subclass of AbstractServlet to handle requests and craft responses
class MyServlet < WEBrick::HTTPServlet::AbstractServlet
    def do_GET (request, response)
      STDERR.puts request
      response.status = 200
      response.content_type = "text/plain"
      response.body = "Hello World\n"
    end
end

# Connect the server with a port
webserver = WEBrick::HTTPServer.new(:Port => 3000)
# Provide a way to quit
trap("INT") {
  webserver.shutdown
}
# Mount our subclass at /
webserver.mount "/", MyServlet
# Start our server
webserver.start
