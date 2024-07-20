module Pseudorandom
  class Generate
    attr_accessor :seed

    def iterator
      @iterator ||= next_iterator
    end
    attr_writer :iterator

    def reset(namespace=nil)
      self.iterator = next_iterator(namespace)
    end

    def reset?(namespace=nil)
      if iterator.iterated?
        false
      elsif namespace.nil?
        true
      else
        iterator.namespace?(namespace)
      end
    end

    def next_iterator(namespace=nil)
      Iterator.build(seed, namespace:)
    end
  end
end
