module Pseudorandom
  module Controls
    module Namespace
      def self.example
        'some-namespace'
      end

      def self.other_example
        'some-other-namespace'
      end

      module Hash
        def self.example(namespace=nil)
          namespace ||= Namespace.example

          Pseudorandom::Iterator.namespace_hash(namespace)
        end
      end
    end
  end
end
