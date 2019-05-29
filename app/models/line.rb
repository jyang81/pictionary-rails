class Line < ApplicationRecord
    after_create_commit do
        CanvasLineCreationEventBroadcastJob.perform_later(self)
      end
end
