class CanvasChannel < ApplicationCable::Channel
  def subscribed
    stream_from "canvas_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(opts) 
    Line.create(
      color: opts.fetch('color'),
      strokeWidth:  opts.fetch('strokeWidth'),
      coordinates: opts.fetch('coordinates')
    )
  end

  def clear(opts)
    Line.destroy_all
    ActionCable
    .server
    .broadcast(
      'canvas_channel',
      clear: 'clear'
    )
  end

  def undo(opts)
    if Line.last
      Line.last.destroy
      ActionCable
      .server
      .broadcast(
        'canvas_channel',
        undo: 'undo'
      )
    end
  end
end
