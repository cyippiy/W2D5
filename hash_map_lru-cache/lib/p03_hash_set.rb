class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    #
    resize! if @count >= @store.length
    unless include?(key)
      self[key.hash].concat([key])
      @count += 1
    end
    #
  end

  def include?(key)
    return true if self[key.hash].include?(key)
    false
  end

  def remove(key)
    self[key.hash].each do |el|
      if el == key
        self[key.hash].delete(el)
        @count -= 1
      end
    end
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = Array.new(@store.length*2){Array.new}
    
    @store.each do |bucket|
      bucket.each do |el|
        temp[(el % temp.length)] += [el]
      end
    end
    
    @store = temp
  end
  # current_size = @buckets*2
  # 
  # temp = Array.new(current_size){Array.new}
  # #redistribute new array with values from @store
  # @store.each do |bucket|
  #   bucket.each do |el|
  #     temp[(el % current_size)] += [el]
  #   end
  # end
  # #reassign @store to temp
  # @store = temp
  # @buckets = current_size
  
  
  
  
end
