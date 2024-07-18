require_relative '../../automated_init'

context "Iterator" do
  context "Source Predicate" do
    context "Optional Namespace Given" do
      seed = Controls::Seed.example
      namespace = Controls::Namespace.example

      context "Is Iterator's Source" do
        context "Namespace And Seed Correspond" do
          iterator = Iterator.build(seed, namespace:)

          is_source = iterator.source?(seed, namespace)

          test do
            assert(is_source)
          end
        end
      end

      context "Isn't Iterator's Source" do
        context "Seed Doesn't Correspond" do
          other_seed = Controls::Seed.other_example

          iterator = Iterator.build(seed, namespace:)

          is_source = iterator.source?(other_seed, namespace)

          test do
            refute(is_source)
          end
        end

        context "Iterator Doesn't Have a Namespace" do
          iterator = Iterator.build(seed)

          is_source = iterator.source?(seed, namespace)

          test do
            refute(is_source)
          end
        end
      end
    end
  end
end
