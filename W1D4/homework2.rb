class Stack
    def initialize
      # create ivar to store stack here!
      @ivar = []

    end

    def add(el)

      # adds an element to the stack
      @ivar.push(el)
    end

    def remove
      # removes one element from the stack
      @ivar.pop
    end

    def show
      # return a copy of the stack
      @ivar
    end
  end

#  Now let's write a Queue class. We will need the following instance methods:
#  enqueue(el), dequeue, and show.

#  Test your code to ensure it follows the principle of FIFO.

class Queue
  def initialize
    @ivar = []
  end

  def enqueue(el)
    @ivar.unshift(el)
  end

  def dequeue
    @ivar.pop
  end

  def show
    @ivar
  end
end

# As you saw in the videos for tonight, a map can be implemented using a 2D array.
# Let's write a Map class (following a similar pattern to Stack and Queue) that
# implements a map using only arrays.
#
# Remember, a map stores information in key-value pairs, where the keys are always
# unique. When implemented with arrays, a map might look something like this:
# my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
#
# Our Map class should have the following instance methods: assign(key, value),
# lookup(key), remove(key), show. Note that the assign method can be used to either
# create a new key-value pair or update the value for a pre-existing key. It's up
# to you to check whether a key currently exists!
#
# As always, test your code thoroughly to make sure all properties of maps are enforced.

class Map
  def initialize
    @ivar = []
  end

  def assign(key, value)
    @ivar << [key, value] unless @ivar.any? { |block| block[0] == key }
  end

  def lookup(key)
    @ivar.each do |array|
      return array if array[0] == key
    end
    nil
  end

  def remove(key)
    @ivar.each do |array|
      return @ivar.delete(array) if array[0] == key
    end
    nil
  end

  def show
    @ivar
  end
end
