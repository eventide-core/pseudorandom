require_relative '../automated_init'

context "Generate" do
  context "Next Iterator" do
    generate = Generate.new

    previous_iterator = generate.iterator
    previous_seed = previous_iterator.seed

    context "Optional Namespace Given" do
      namespace = Controls::Namespace.example
      iterator = generate.next_iterator(namespace)

      test "Sourced from previous iterator's seed and the given namespace" do
        assert(iterator.source?(previous_seed, namespace))
      end
    end

    context "Optional Namespace Omitted" do
      iterator = generate.next_iterator

      test "Sourced from previous iterator's seed" do
        assert(iterator.source?(previous_seed))
      end
    end
  end
end
