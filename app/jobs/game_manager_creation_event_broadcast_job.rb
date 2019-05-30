class GameManagerCreationEventBroadcastJob < ApplicationJob
      queue_as :default
    
      def perform(game_manager)
        ActionCable
          .server
          .broadcast('manager_channel', command: game_manager.command)
      end
    end