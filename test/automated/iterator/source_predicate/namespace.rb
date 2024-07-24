require_relative '../../automated_init'

context "Iterator" do
  context "Source Predicate" do
    context "Optional Namespace Given" do
      control_seed = Controls::Seed.example
      control_namespace = Controls::Namespace.example

      context "Is Iterator's Source" do
        iterator = Iterator.build(control_seed, control_namespace)

        context "Namespace And Seed Correspond" do
          seed = control_seed
          namespace = control_namespace

          is_source = iterator.source?(seed, namespace)

          test do
            assert(is_source)
          end
        end
      end

      context "Isn't Iterator's Source" do
        context "Seed Doesn't Correspond" do
          seed = Controls::Seed.other_example

          iterator = Iterator.build(control_seed, control_namespace)

          is_source = iterator.source?(seed, control_namespace)

          test do
            refute(is_source)
          end
        end

        context "Iterator Doesn't Have a Namespace" do
          seed = control_seed

          iterator = Iterator.build(control_seed)

          is_source = iterator.source?(seed, control_namespace)

          test do
            refute(is_source)
          end
        end
      end
    end
  end
end
