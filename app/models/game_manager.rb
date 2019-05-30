class GameManager < ApplicationRecord
    after_create_commit do
        GameManagerCreationEventBroadcastJob.perform_later(self)
      end
end
