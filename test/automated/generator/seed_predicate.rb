require_relative '../automated_init'

context "Generator" do
  context "Seed Predicate" do
    control_seed = Controls::Seed.example

    context "Given Seed Corresponds With Generator's Seed" do
      seed = control_seed

      generator = Generator.new(control_seed)

      is_seed = generator.seed?(seed)

      test do
        assert(is_seed)
      end
    end

    context "Given Seed Doesn't Correspond With Generator's Seed" do
      seed = Controls::Seed.other_example

      generator = Generator.new(control_seed)

      is_seed = generator.seed?(seed)

      test do
        refute(is_seed)
      end
    end
  end
end
