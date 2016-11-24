# Thanks for the template to Luke Franci at
# http://practicingruby.com/articles/implementing-an-http-file-server
require "socket"

tcpserver = TCPServer.new 3000
while (socket = tcpserver.accept)
  request = socket.gets
  STDERR.puts request
  response = "Hello World!\n"
  
  # Create HTTP protocol
  # We need to include the Content-Type and Content-Length headers
  # to let the client know the size and type of data
  # contained in the response. Note that HTTP is whitespace
  # sensitive, and expects each header line to end with CRLF 
  # (i.e. "\r\n")
  headers = ["HTTP/1.1 200 OK",
           "Server: Ruby",
           "Content-Type: text/plain; charset=iso-8859-1",
           "Content-Length: #{response.length}\r\n\r\n"].join("\r\n")
  socket.print headers
  socket.print response
  socket.close
end
