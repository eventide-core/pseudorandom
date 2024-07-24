require_relative '../automated_init'

context "Generator" do
  context "Namespace Predicate" do
    control_namespace = Controls::Namespace.example

    control_seed = Controls::Seed.example

    context "Given Namespace Corresponds With Generator's Namespace" do
      namespace = control_namespace

      generator = Generator.new(control_seed)
      generator.reset(control_namespace)

      is_namespace = generator.namespace?(namespace)

      test do
        assert(is_namespace)
      end
    end

    context "Given Namespace Doesn't Correspond With Generator's Namespace" do
      namespace = Controls::Namespace.other_example

      generator = Generator.new(control_seed)
      generator.reset(control_namespace)

      is_namespace = generator.namespace?(namespace)

      test do
        refute(is_namespace)
      end
    end
  end
end
