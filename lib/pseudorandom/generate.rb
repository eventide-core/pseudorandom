module Pseudorandom
  class Generate
    def iterator
      @iterator ||= Iterator.build
    end
    attr_writer :iterator

    def reset?(namespace=nil)
      if iterator.iterated?
        false
      elsif namespace.nil?
        true
      else
        iterator.namespace?(namespace)
      end
    end
  end
end
