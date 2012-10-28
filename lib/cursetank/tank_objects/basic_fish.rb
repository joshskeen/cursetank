#####
##### cursetank!
#####
require './cursetank/tank_objects/tank_object'
  class BasicFish < TankObject

    def initialize(args={})
      super(args)
      @height    = 1
      @width     = 5
      @swin      = @win.subwin(@height, @width, 0, 0)
      @color     = args.fetch(:color, 1)
      @speed     = args.fetch(:speed, 0.1)
    end

    def frames
      ["><_'>",
       "><_\">"
       ]
    end

    def frames_reverse
      ["<'_><",
       "<\"_><"
       ]
    end

    def draw
      set_direction
      @frame += @speed
      @frame = 0 if @frame > @maxframes - 1
      @swin.setpos(0, 0)
      @swin.move(@pos_y, @pos_x)
      frame  = frames[@frame.round.to_i]
      frame  = frames_reverse[@frame.round.to_i] if @dir_right == -1
      @swin.attron(Curses.color_pair(@color)){
        @swin.addstr(frame)
      }
      change_row = rand(100)
      @pos_y += @speed * @dir_down if change_row == 7
      @pos_x += @speed * @dir_right
      @swin.refresh()
    end

  end