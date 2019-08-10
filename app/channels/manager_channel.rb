class ManagerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "manager_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def updateGameState(opts)
    # GameManager.create(command: 'updatedGameState', payload: opts.fetch('command'))
    ActionCable
    .server
    .broadcast('manager_channel',
      command: 'updatedGameState',
      payload: opts.payload 
    )
  end

  def addUserToGame(opts)
    game = Game.find(opts.gameId)
    users = game.users 
    users.push(opts.username)
    game.users = users
    game.save
    # GameManager.create(command: 'updatedUsers', payload: users)
    ActionCable
    .server
    .broadcast('manager_channel',
      command: 'updatedUsers',
      payload: users 
    )
  end

  def removeUserFromGame(opts)

  end
end
