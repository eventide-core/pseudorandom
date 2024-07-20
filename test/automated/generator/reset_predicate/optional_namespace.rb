require_relative '../../automated_init'

context "Generator" do
  context "Reset Predicate" do
    context "Optional Namespace Given" do
      namespace = Controls::Namespace.example

      context "Is Reset" do
        context "Namespace Corresponds With Iterator's Namespace" do
          iterator = Iterator.build(namespace:)

          generator = Generator.new
          generator.iterator = iterator

          is_reset = generator.reset?(namespace)

          test do
            assert(is_reset)
          end
        end
      end

      context "Isn't Reset" do
        context "Namespace Doesn't Correspond With Iterator's Namespace" do
          other_namespace = Controls::Namespace.other_example

          iterator = Iterator.build(namespace:)

          generator = Generator.new
          generator.iterator = iterator

          is_reset = generator.reset?(other_namespace)

          test do
            refute(is_reset)
          end
        end

        context "Iterator Doesn't Have a Namespace" do
          iterator = Iterator.build

          generator = Generator.new
          generator.iterator = iterator

          is_reset = generator.reset?(namespace)

          test do
            refute(is_reset)
          end
        end
      end
    end
  end
end
