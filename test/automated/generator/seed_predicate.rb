require_relative '../automated_init'

context "Generator" do
  context "Seed Predicate" do
    seed = Controls::Seed.example

    context "Given Seed Corresponds With Iterator's Seed" do
      iterator = Iterator.build(seed)

      generator = Generator.new
      generator.iterator = iterator

      is_seed = generator.seed?(seed)

      test do
        assert(is_seed)
      end
    end

    context "Given Seed Doesn't Correspond With Iterator's Seed" do
      other_seed = Controls::Seed.other_example
      iterator = Iterator.build(other_seed)

      generator = Generator.new
      generator.iterator = iterator

      is_seed = generator.seed?(seed)

      test do
        refute(is_seed)
      end
    end
  end
end
