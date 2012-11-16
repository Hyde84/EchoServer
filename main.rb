require 'eventmachine'

class EchoServer < EventMachine::Connection
  def post_init
    puts 'Client connected'
  end

  def receive_data data
    send_data ">>> #{data}"
    close_connection if data=~/quit/i
  end

  def unbind
    puts 'Client disconnected'
  end
end

EventMachine::run{
  EventMachine::start_server '', 11777, EchoServer
}
