module Pseudorandom
  class Iterator
    def sequence
      @sequence ||= 0
    end
    attr_writer :sequence

    def namespace
      @namespace ||= Defaults.namespace
    end
    attr_writer :namespace

    def reset?(namespace=nil)
      if not sequence.zero?
        return false
      end

      if namespace.nil?
        true
      else
        namespace == self.namespace
      end
    end
  end
end
