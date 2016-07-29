require 'minigl'
include MiniGL
 
class Shuriken < GameObject
    attr_reader :dead
 
      def initialize(x, y, direction, speed)
        super x, y, 20, 20, :shuriken, Vector.new(-5, -5), 2, 2
        case direction
        when :up    then @aim = Vector.new(@x, @y - 630)
        when :right then @aim = Vector.new(@x + 830, @y)
        when :down  then @aim = Vector.new(@x, @y + 630)
        when :left  then @aim = Vector.new(@x - 830, @y)
        end
        @speed_m = speed
      end

      def update(obj)
        move_free @aim, @speed_m
        animate [0, 1, 2, 3], 4
        return :dead if obj.bounds.intersect?(bounds)
        @dead = true if @speed.x == 0 && @speed.y == 0
      end
end