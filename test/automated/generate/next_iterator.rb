require_relative '../automated_init'

context "Generate" do
  context "Next Iterator" do
    generate = Generate.new

    previous_iterator = generate.iterator
    previous_seed = previous_iterator.seed

    context "Optional Namespace Omitted" do
      iterator = generate.next_iterator

      context "Iterator" do
        test "Previous iterator's seed" do
          assert(iterator.seed?(previous_seed))
        end
      end
    end

    context "Optional Namespace Given" do
      namespace = Controls::Namespace.example
      iterator = generate.next_iterator(namespace)

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
