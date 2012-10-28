#####
##### cursetank!
#####
require 'cursetank/tank_objects/tank_object'
module Cursetank
class Plant < TankObject

  MAX_PLANT_HEIGHT = 14

  def initialize(args={})
    super(args)
    @height    = args.fetch(:plant_height, 14)
    @width     = 5
    @swin      = @win.subwin(@height, @width, 0, 0)
    @pos_y = @win.maxy - @height
    @speed = 0.1
    @frame = rand(0..frames.length - 1)
  end

  def frames
    ["
(.
 )
 .(
 )
.(
 )..
(
 (.
   )
 .(
 )
 .(
 )..
(",
     "
.(
 )
 (.
  )
.(
  )
 (.
 .(
  )
 (.
  )
 .(
 )
(.",
     "
(.
 . )
 (
  )
  (.
  )
 (.
.
 .)
  (
   )
 (.
 )
(.",
     "
(.
 )
  .(
  )
  (.
 .)
(.
 (.
 )
  .(
   )
  (.
 .)
(."
     ]
  end

  def draw
    @swin.setpos(0, 0)
    @swin.move(@pos_y, @pos_x)
    @frame += @speed
    @frame = 0 if @frame > @maxframes - 1
    @swin.setpos(0, 0)
    @swin.move(@pos_y, @pos_x)
    frame  = frames[@frame.round.to_i]

    @swin.attron(Curses.color_pair(2)){
      @swin.addstr(frame)
    }
    @swin.refresh()
  end

end
end