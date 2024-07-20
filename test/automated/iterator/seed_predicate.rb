require_relative '../automated_init'

context "Iterator" do
  context "Seed Predicate" do
    seed = Controls::Seed.example

    context "Given Seed Corresponds With Iterator's Seed" do
      context "Iterator Has a Namespace" do
        namespace = Controls::Namespace.example

        iterator = Iterator.build(seed, namespace:)

        is_seed = iterator.seed?(seed)

        test do
          assert(is_seed)
        end
      end

      context "Iterator Doesn't Have a Namespace" do
        iterator = Iterator.build(seed)

        is_seed = iterator.seed?(seed)

        test do
          assert(is_seed)
        end
      end
    end

    context "Given Seed Doesn't Correspond With Iterator's Seed" do
      other_seed = Controls::Seed.other_example

      iterator = Iterator.build(seed)

      is_seed = iterator.seed?(other_seed)

      test do
        refute(is_seed)
      end
    end
  end
end
