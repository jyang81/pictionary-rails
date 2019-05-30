class ManagerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "manager_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(opts)
    GameManager.create(command: opts.fetch('command'))
  end
end
