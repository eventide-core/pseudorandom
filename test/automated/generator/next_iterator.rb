require_relative '../automated_init'

context "Generator" do
  context "Next Iterator" do
    generator = Generator.new

    previous_iterator = generator.iterator
    previous_seed = previous_iterator.seed

    context "Optional Namespace Omitted" do
      iterator = generator.next_iterator

      context "Iterator" do
        test "Previous iterator's seed" do
          assert(iterator.seed?(previous_seed))
        end
      end
    end

    context "Optional Namespace Given" do
      namespace = Controls::Namespace.example
      iterator = generator.next_iterator(namespace)

      context "Iterator" do
        test "Namespace" do
          assert(iterator.namespace?(namespace))
        end

        test "Previous iterator's seed" do
          assert(iterator.seed?(previous_seed))
        end
      end
    end
  end
end
