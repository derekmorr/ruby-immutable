# monkey patch a tail method into Array
class Array
  def tail
    first, *rest = self
    rest
  end
end

def reverse(elements)
  if elements == []
    []
  else
    first, *rest = elements
    reverse(rest) << first
  end
end

def length(elements)
  if elements == []
    0
  else
    1 + length(elements.tail)
  end
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
  return false if elements.empty?
  head, *tail = elements
  if head == target
    true
  else
    include?(tail, target)
  end
end

def map(elements, &block)
  return [] if elements.empty?
  head, *tail = elements
  [block.call(head)] + map(tail, &block)
end

def select(elements, &predicate)
  return [] if elements.empty?
  head, *tail = elements
  if (predicate.call(head))
    [head] + select(tail, &predicate)
  else
    select(tail, &predicate)
  end
end