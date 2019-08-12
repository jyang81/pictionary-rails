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
      payload: opts.fetch('payload')
    )
  end

  def addUserToGame(opts)
    # game = Game.find(opts.fetch('gameId')) # uncomment for multigame
    game = Game.all.first # This is temporary until multi game is implimented
    users = game.users 
    users.push(User.where(name: opts.fetch('username')))
    game.users = users
    game.save
    # GameManager.create(command: 'updatedUsers', payload: users)
    puts "adding user to game here is game info: #{game}"
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
