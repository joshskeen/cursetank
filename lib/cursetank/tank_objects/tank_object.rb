#####
##### cursetank!
#####
#base class for tank objects
  class TankObject

    def initialize(args={})
      @frame     = 0
      @win       = args.fetch(:window)
      @pos_x     = args.fetch(:pos_x, 0)
      @pos_y     = args.fetch(:pos_y, 0)
      @dir_right = args.fetch(:dir_right, 1)
      @dir_down  = args.fetch(:dir_down, 1)
      @maxframes = frames.length
    end

    def set_direction
      @dir_right = -1 if @swin.begx >= @win.maxx - 10
      @dir_right = 1 if @swin.begx <= 5
      @dir_down  = -1 if @swin.begy >= @win.maxy - 10
      @dir_down  = 1 if @swin.begy <= 5
    end


    def frames
      []
    end

    def draw
      raise Exception("draw method not implemented!")
    end

  end
