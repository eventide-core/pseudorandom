module Pseudorandom
  class Generate
    attr_accessor :seed

    def iterator
      @iterator ||= next_iterator
    end
    attr_writer :iterator

    def self.build(seed=nil)
      seed ||= Defaults.seed

      instance = new
      instance.seed = seed
      instance
    end

    def string
      self.integer.to_s(36)
    end

    def boolean
      self.integer % 2 == 1
    end

    def integer
      iterator.next.unpack1('Q>')
    end

    def decimal
      iterator.next.unpack1('D')
    end

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
