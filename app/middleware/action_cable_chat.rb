# middleware/action_cable_chat.rb

# class ChatActionCable
#   def initialize(app, options={})
#     @app = app
#     ActionCable.server.config.allowed_request_origins = ["http://localhost:3001", "https://react-pictionary.herokuapp.com/"]
#   end
#
#   def call(env)
#     if ::WebSocket::Driver.websocket?(env)
#       ActionCable.server.call(env)
#     else
#       @app.call(env)
#     end
#   end
# end
