require_relative '../automated_init'

context "Iterator" do
  context "Build" do
    seed = Controls::Seed.example
    namespace = Controls::Namespace.example

    iterator = Iterator.build(seed, namespace:)

    test "Seed" do
      assert(iterator.seed?(seed))
    end

    test "Namespace" do
      assert(iterator.namespace?(namespace))
    end
  end
end
