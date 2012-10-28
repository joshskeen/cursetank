#####
##### cursetank!
#####
module Cursetank
  class Bubble < TankObject

    def initialize(args={})
      super(args)
      @height    = 2
      @width     = 3
      @pos_x     = args.fetch(:pos_x)
      @pos_y     = @win.maxy - @height - rand(1..20)
      @swin      = @win.subwin(@height, @width, 0, 0)
      @color     = args.fetch(:color, 1)
      @speed     = 0.2
      @frame     = rand(0..frames.length - 1)
      @bubbles    = args.fetch(:bubbles)
    end

    def frames
      [".O
o *",
       ".
..o",
       ".o
."
       ]
    end

    def draw
      @frame += @speed
      @frame = 0 if @frame > @maxframes - 1
      @swin.setpos(0, 0)
      @swin.move(@pos_y, @pos_x)
      frame  = frames[@frame.round.to_i]
      @swin.attron(Curses.color_pair(@color)){
        @swin.addstr(frame)
      }
      @swin.refresh()
      @pos_y += @speed * -1

      @bubbles.delete(self) if @pos_y <= 0

    end

  end
end