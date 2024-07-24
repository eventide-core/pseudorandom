require_relative '../automated_init'

context "Iterator" do
  context "Seed Predicate" do
    control_seed = Controls::Seed.example

    context "Given Seed Corresponds With Iterator's Seed" do
      seed = control_seed

      context "Iterator Has a Namespace" do
        control_namespace = Controls::Namespace.example

        iterator = Iterator.build(control_seed, control_namespace)

        is_seed = iterator.seed?(seed)

        test do
          assert(is_seed)
        end
      end

      context "Iterator Doesn't Have a Namespace" do
        iterator = Iterator.build(control_seed)

        is_seed = iterator.seed?(seed)

        test do
          assert(is_seed)
        end
      end
    end

    context "Given Seed Doesn't Correspond With Iterator's Seed" do
      seed = Controls::Seed.other_example

      iterator = Iterator.build(control_seed)

      is_seed = iterator.seed?(seed)

      test do
        refute(is_seed)
      end
    end
  end
end
