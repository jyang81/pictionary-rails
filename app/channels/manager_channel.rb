class ManagerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "manager_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(opts)
    GameManager.create(command: 'updatedGameState', payload: opts.fetch('command'))
  end

  def addUserToGame(opts)
    game = Game.find(opts.gameId)
    users = game.users 
    users.push(opts.username)
    game.users = users
    game.save
    GameManager.create(command: 'updatedUsers', payload: users)
  end

  def removeUserFromGame(opts)

  end
end
