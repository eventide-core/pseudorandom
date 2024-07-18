require_relative '../../automated_init'

context "Iterator" do
  context "Source Predicate" do
    context "Optional Namespace Omitted" do
      seed = Controls::Seed.example

      context "Is Iterator's Source" do
        context "Iterator Doesn't Have a Namespace" do
          context "Seed Corresponds" do
            iterator = Iterator.build(seed)

            is_source = iterator.source?(seed)

            test do
              assert(is_source)
            end
          end
        end
      end

      context "Isn't Iterator's Source" do
        context "Seed Doesn't Correspond" do
          other_seed = Controls::Seed.other_example

          iterator = Iterator.build(seed)

          is_source = iterator.source?(other_seed)

          test do
            refute(is_source)
          end
        end

        context "Iterator Has a Namespace" do
          namespace = Controls::Namespace.example

          iterator = Iterator.build(seed, namespace:)

          is_source = iterator.source?(seed)

          test do
            refute(is_source)
          end
        end
      end
    end
  end
end
