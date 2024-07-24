require_relative '../../automated_init'

context "Generator" do
  context "Reset Predicate" do
    context "Optional Namespace Given" do
      control_namespace = Controls::Namespace.example

      control_seed = Controls::Seed.example

      context "Is Reset" do
        context "Namespace Corresponds With Iterator's Namespace" do
          namespace = control_namespace

          generator = Generator.new(control_seed)
          generator.reset(control_namespace)

          is_reset = generator.reset?(namespace)

          test do
            assert(is_reset)
          end
        end
      end

      context "Isn't Reset" do
        context "Namespace Doesn't Correspond With Iterator's Namespace" do
          namespace = Controls::Namespace.other_example

          generator = Generator.new(control_seed)
          generator.reset(control_namespace)

          is_reset = generator.reset?(namespace)

          test do
            refute(is_reset)
          end
        end

        context "Iterator Doesn't Have a Namespace" do
          generator = Generator.new(control_seed)

          is_reset = generator.reset?(control_namespace)

          test do
            refute(is_reset)
          end
        end
      end
    end
  end
end
