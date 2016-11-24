require 'socket' # Provides TCPServer and TCPSocket classes

  # We need to include the Content-Type and Content-Length headers
  # to let the client know the size and type of data
  # contained in the response. Note that HTTP is whitespace
  # sensitive, and expects each header line to end with CRLF (i.e. "\r\n")
  headers = ["HTTP/1.1 200 OK",
             "Server: Ruby",
             "Content-Type: text/plain; charset=iso-8859-1",
             "Content-Length: #{resp.length}\r\n\r\n"].join("\r\n")

# Initialize a TCPServer object that will listen on localhost:3000 for incoming connections
server = TCPServer.new('localhost', 3000)

# loop infinitely, processing one incoming connection at a time
loop do

  # Wait until a client connects, then return a TCPSocket I/O object
  socket = server.accept

  # Read the first line of the request (the Request-Line)
  request = socket.gets

  # Log the request to the console for debugging
  STDERR.puts request

  response = "Hello World!\n"

  # response header required per HTTP protocol 
  socket.print header
  socket.print response
  # Close the socket, terminating the connection
  socket.close
end
