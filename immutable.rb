# monkey patch a tail method into Array
class Array
  def tail
    first, *rest = self
    rest
  end
end

def fold(accumulator, elements, &block)
  return accumulator if elements == []
  
  first, *rest = elements
  new_accumulator = block.call(accumulator, first)
  fold(new_accumulator, rest, &block)
end

def reverse(elements)
  fold([], elements) { |acc, e| [e] + acc }
end

def length(elements)
  fold(0, elements) { |acc, e| acc + 1 }  
end

def drop(count, elements)
  if count == 0
    elements
  else
    drop(count-1, elements.tail)
  end
end

def take(count, elements)
  if count == 0 || elements.empty?
    []
  else
    head, *tail = elements
    [head] + take(count-1, tail)
  end
end

def include?(elements, target)
  fold(false, elements) do |acc, e|
    if not acc
      e == target
    else
      acc
    end
  end
end

def map(elements, &block)
  fold([], elements) { |acc, e| acc << block.call(e) }
end

def select(elements, &predicate)
  fold([], elements) do |acc, e| 
    if predicate.call(e)
      acc << e
    else
      acc
    end
  end
end