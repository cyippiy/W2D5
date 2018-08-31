class MaxIntSet
  attr_accessor :store
  
  def initialize(max)
    @store = []
    @max = max
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @store << num
    
  end

  def remove(num)
    @store.each do |number|
      if num == number
        @store.delete(number)
      end
    end
  end

  def include?(num)
    return true if @store.include?(num) || nil
    return false unless @store.include?(num) || nil
  end

  private

  def is_valid?(num)
    
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store << num
  end

  def remove(num)
    @store.each do |number|
      if num == number
        @store.delete(number)
      end
    end
  end

  def include?(num)
    return true if @store.include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    num % @store.length
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :buckets, :store
  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @buckets = num_buckets
    @count = 0
  end
  
  def inspect
    
  end

  def insert(num)
    resize! if @count >= @buckets  
    unless include?(num)
      self[num].concat([num]) 
      @count += 1  
    end
  end

  def remove(num)
    self[num].each do |number|
      if num == number
        self[num].delete(number)
        @count -= 1
      end
    end
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @buckets]
  end
  
  def []=(num,value)
    @store[num % @buckets] = value
  end
  def num_buckets
    @buckets
  end

  def resize!
    current_size = @buckets*2
    # current_size.times do 
    #   @store << []
    # end
    temp = Array.new(current_size){Array.new}
    #redistribute new array with values from @store
    @store.each do |bucket|
      bucket.each do |el|
        temp[(el % current_size)] += [el]
      end
    end
    
    # @store.reject {|el| el.empty?}.each do |el|
    #   temp[(el % current_size)] += [el]
    # end
    #reassign @store to temp
    @store = temp
    @buckets = current_size
  end
end
