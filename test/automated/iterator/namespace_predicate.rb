require_relative '../automated_init'

context "Iterator" do
  context "Namespace Predicate" do
    namespace = Controls::Namespace.example

    context "Given Namespace Corresponds With Iterator's Namespace" do
      iterator = Iterator.build(namespace:)

      is_namespace = iterator.namespace?(namespace)

      test do
        assert(is_namespace)
      end
    end

    context "Given Namespace Doesn't Correspond With Iterator's Namespace" do
      context "Iterator Has a Different Namespace" do
        other_namespace = Controls::Namespace.other_example

        iterator = Iterator.build(namespace: other_namespace)

        is_namespace = iterator.namespace?(namespace)

        test do
          refute(is_namespace)
        end
      end

      context "Iterator Doesn't Have a Namespace" do
        iterator = Iterator.build

        is_namespace = iterator.namespace?(namespace)

        test do
          refute(is_namespace)
        end
      end
    end
  end
end
