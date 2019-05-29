class CanvasLineCreationEventBroadcastJob < ApplicationJob
      queue_as :default
    
      def perform(canvas_line)
        ActionCable
          .server
          .broadcast('canvas_channel',
                     id: canvas_line.id,
                     created_at: canvas_line.created_at.strftime('%H:%M'),
                     color: canvas_line.color,
                     strokeWidth: canvas_line.strokeWidth,
                     coordinates: canvas_line.coordinates)
      end
    end