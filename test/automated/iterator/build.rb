require_relative '../automated_init'

context "Iterator" do
  context "Build" do
    seed = Controls::Seed.example
    namespace = Controls::Namespace.example

    iterator = Iterator.build(seed, namespace:)

    context "Iterator's Source" do
      random_source = iterator.source?(seed, namespace)

      test "Is the given seed and namespace" do
        assert(random_source)
      end
    end
  end
end
