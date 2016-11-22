# Thanks for the template to Luke Franci at
# http://practicingruby.com/articles/implementing-an-http-file-server
require "socket"

webserver = TCPServer.new('localhost', 3000)
while (session = webserver.accept)
  request = server.gets
  STDERR.puts request
  response = "Hello World!\n"
  
  # Create HTTP protocol
  # We need to include the Content-Type and Content-Length headers
  # to let the client know the size and type of data
  # contained in the response. Note that HTTP is whitespace
  # sensitive, and expects each header line to end with CRLF 
  # (i.e. "\r\n")
  headers = ["HTTP/1.1 200 OK",
           "Date: Tue, 14 Dec 2010 10:48:45 GMT",
           "Server: Ruby",
           "Content-Type: text/html; charset=iso-8859-1",
           "Content-Length: #{resp.length}\r\n\r\n"].join("\r\n")

  socket.print headers
  
  # Now create a valid HTML page
  session.print "<HTML><BODY>"
  session.print response
  session.print "</BODY></HTML>"
  session.close
end
