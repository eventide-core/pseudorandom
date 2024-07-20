require_relative '../automated_init'

context "Generator" do
  context "Namespace Predicate" do
    namespace = Controls::Namespace.example

    context "Given Namespace Corresponds With Iterator's Namespace" do
      iterator = Iterator.build(namespace:)

      generator = Generator.new
      generator.iterator = iterator

      is_namespace = generator.namespace?(namespace)

      test do
        assert(is_namespace)
      end
    end

    context "Given Namespace Doesn't Correspond With Iterator's Namespace" do
      other_namespace = Controls::Namespace.other_example
      iterator = Iterator.build(namespace: other_namespace)

      generator = Generator.new
      generator.iterator = iterator

      is_namespace = generator.namespace?(namespace)

      test do
        refute(is_namespace)
      end
    end
  end
end
