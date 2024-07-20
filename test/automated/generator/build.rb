require_relative '../automated_init'

context "Generator" do
  context "Build" do
    seed = Controls::Seed.example
    namespace = Controls::Namespace.example

    generator = Generator.build(seed, namespace:)

    test "Seed" do
      assert(generator.seed?(seed))
    end

    test "Namespace" do
      assert(generator.namespace?(namespace))
    end
  end
end
