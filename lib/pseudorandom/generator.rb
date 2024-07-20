module Pseudorandom
  class Generator
    attr_accessor :seed
    attr_accessor :namespace

    def iterator
      @iterator ||= Iterator.build(seed, namespace:)
    end
    attr_writer :iterator

    def self.build(seed=nil, namespace: nil)
      seed ||= Defaults.seed

      instance = new
      instance.seed = seed
      instance.namespace = namespace
      instance
    end

    def self.configure(receiver, seed=nil, namespace: nil, attr_name: nil)
      attr_name ||= :random_generator

      instance = build(seed, namespace:)
      receiver.public_send(:"#{attr_name}=", instance)
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
      if not namespace.nil?
        self.namespace = namespace
      end

      self.iterator = nil
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

    def seed?(seed)
      iterator.seed?(seed)
    end

    def namespace?(namespace)
      iterator.namespace?(namespace)
    end
  end
end
