#####
##### cursetank!
#####
require 'cursetank/tank_objects/tank_object'
module Cursetank
  class Octopus < TankObject

    def initialize(args={})
      super(args)
      @height    = 5
      @width     = 8
      @swin      = @win.subwin(@height, @width, 0, 0)
      @color     = args.fetch(:color, 1)
      @speed     = args.fetch(:speed, 0.1)
    end

    def frames
      # credit to (hh) from http://ascii.co.uk/art/octopus
      octopus_frame1 = <<-OCTOPUS_FRAME1
 ,---.
( @ @ )
 ).-.(
'/|||\\`
  '|`  
OCTOPUS_FRAME1
      octopus_frame2 = <<-OCTOPUS_FRAME2
 ,---.
( @ @ )
 ).-.(
 \\|||/
  |'|  
OCTOPUS_FRAME2
       [octopus_frame1, octopus_frame2]
    end

    def draw
      set_direction
      @frame += @speed
      @frame = 0 if @frame > @maxframes - 1
      @swin.setpos(0, 0)
      @swin.move(@pos_y, @pos_x)
      frame  = frames[@frame.round.to_i]
      @swin.attron(Curses.color_pair(@color)){
        @swin.addstr(frame)
      }
      change_col = rand(10)
      @pos_y += @speed * @dir_down
      @pos_x += @speed * @dir_right if change_col == 7
      @swin.refresh()
    end

  end
end