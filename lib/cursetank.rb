require "cursetank/version"
require 'cursetank/tank_objects/basic_fish'
require 'cursetank/tank_objects/octopus'
require 'cursetank/tank_objects/bubble'
require 'cursetank/tank_objects/plant'

require 'curses'

module Cursetank
  include Curses
  class Cursetank
    def initialize
      setup_curses
      @win = Curses::Window.new(0, 0, 0, 0)
      main
    end

    def main
      @plantlife_back = setup_plantlife
      @fishes = setup_fishes
      @octopuses = setup_octopuses
      @plantlife_front = setup_plantlife
      @bubbles = []
      loop do
        @plantlife_back.each do | p |
          p.draw
        end
        @fishes.each do | f |
          f.draw
        end
        @octopuses.each do | o |
          o.draw
        end
        @plantlife_front.each do | p |
          p.draw
        end
        generate_bubbles
        @bubbles.each do | b |
          b.draw
        end
        sleep(1.0/15.0)
        @win.clear
        @win.refresh
      end
    end

    private

    def generate_bubbles
      chance = rand(30)
      if chance == 29
        rand_x = rand(150)
        @bubbles << Bubble.new({window: @win, pos_x: rand_x, bubbles: @bubbles })
      end
    end

    def setup_plantlife
      plantlife = []
      plantcount = rand(4..10)
      plantcount.times do | p |
        rand_x = rand(150)
        plant_height = rand(1..Plant::MAX_PLANT_HEIGHT)
        plantlife << Plant.new({window: @win, pos_x: rand_x, plant_height: plant_height})
      end
      plantlife
    end

    def setup_fishes
      fishes = []
      fishcount = rand(10..50)
      fishcount.times do | i |
        rand_x = rand(50)
        rand_y = rand(50)
        rand_speed = rand(0.1..1.5)
        rand_color = rand(1..3)
        rand_dir = rand(2)%2 ? -1 : 1
        fishes << BasicFish.new({window: @win, dir_right: rand_dir, pos_x: rand_x, pos_y: rand_y, speed:rand_speed, color: rand_color})
      end
      fishes
    end
    
    # http://grammarist.com/usage/octopi-octopuses/
    def setup_octopuses
      octopuses = []
      octopuscount = rand(1..5)
      octopuscount.times do | i |
        rand_x = rand(50)
        rand_y = rand(50)
        rand_speed = rand(0.1..0.3)
        rand_color = rand(1..3)
        dir_right = -1 
        octopuses << Octopus.new({window: @win, dir_right: dir_right, pos_x: rand_x, pos_y: rand_y, speed:rand_speed, color: rand_color})
      end
      octopuses
    end

    def setup_curses
      Curses.init_screen()
      Curses.start_color()
      Curses.use_default_colors()
      Curses.noecho
      Curses.cbreak
      Curses.curs_set(0)
      Curses.init_pair(1, Curses::COLOR_CYAN, Curses::COLOR_BLACK)
      Curses.init_pair(2, Curses::COLOR_GREEN, Curses::COLOR_BLACK)
      Curses.init_pair(3, Curses::COLOR_RED, Curses::COLOR_BLACK)
      Curses.init_pair(4, Curses::COLOR_MAGENTA, Curses::COLOR_BLACK)
    end

  end

end
