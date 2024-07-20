require_relative '../../automated_init'

context "Generate" do
  context "Reset Predicate" do
    context "Optional Namespace Given" do
      namespace = Controls::Namespace.example

      context "Is Reset" do
        context "Namespace Corresponds With Iterator's Namespace" do
          iterator = Iterator.build(namespace:)

          generate = Generate.new
          generate.iterator = iterator

          is_reset = generate.reset?(namespace)

          test do
            assert(is_reset)
          end
        end
      end

      context "Isn't Reset" do
        context "Namespace Doesn't Correspond With Iterator's Namespace" do
          other_namespace = Controls::Namespace.other_example

          iterator = Iterator.build(namespace:)

          generate = Generate.new
          generate.iterator = iterator

          is_reset = generate.reset?(other_namespace)

          test do
            refute(is_reset)
          end
        end

        context "Iterator Doesn't Have a Namespace" do
          iterator = Iterator.build

          generate = Generate.new
          generate.iterator = iterator

          is_reset = generate.reset?(namespace)

          test do
            refute(is_reset)
          end
        end
      end
    end
  end
end
