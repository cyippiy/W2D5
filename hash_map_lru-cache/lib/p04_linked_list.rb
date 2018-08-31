class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
  

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  
  attr_accessor :head, :tail
  
  def initialize
    @head = Node.new(nil, nil)
    @tail = Node.new(nil, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next unless @head.next.key.nil?
    @head
  end

  def last
    @tail.prev unless @tail.prev.key.nil?
    @tail
  end

  def empty?
    counter = 1
    next_node = first
    until next_node.next.nil?
      counter += 1
      next_node = next_node.next
    end
    if counter > 2
      return false 
    else
      true
    end
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    temp = Node.new(key,val)
    ### insert at end
    
    ##sets temp's -1 to be -2
    @tail.prev.next = temp
    temp.prev = @tail.prev
    
    #sets temp's -1 to point to tail
    temp.next = @tail
    @tail.prev = temp
    
    ### temp's next should point to tail
    
    ### temp's previous should be 
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  def count
    counter = 1
    next_node = first
    until next_node.next.nil?
      counter += 1
      next_node = next_node.next
    end
    (counter - 2)
  end
  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
