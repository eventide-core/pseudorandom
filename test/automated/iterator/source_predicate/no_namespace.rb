require_relative '../../automated_init'

context "Iterator" do
  context "Source Predicate" do
    context "Optional Namespace Omitted" do
      control_seed = Controls::Seed.example

      context "Is Iterator's Source" do
        context "Iterator Doesn't Have a Namespace" do
          context "Seed Corresponds" do
            seed = control_seed

            iterator = Iterator.build(control_seed)

            is_source = iterator.source?(seed)

            test do
              assert(is_source)
            end
          end
        end
      end

      context "Isn't Iterator's Source" do
        context "Seed Doesn't Correspond" do
          seed = Controls::Seed.other_example

          iterator = Iterator.build(control_seed)

          is_source = iterator.source?(seed)

          test do
            refute(is_source)
          end
        end

        context "Iterator Has a Namespace" do
          control_namespace = Controls::Namespace.example

          iterator = Iterator.build(control_seed, control_namespace)

          is_source = iterator.source?(control_seed)

          test do
            refute(is_source)
          end
        end
      end
    end
  end
end
