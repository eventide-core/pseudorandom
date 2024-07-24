require_relative '../automated_init'

context "Iterator" do
  context "Namespace Predicate" do
    control_namespace = Controls::Namespace.example

    control_seed = Controls::Seed.example

    context "Given Namespace Corresponds With Iterator's Namespace" do
      namespace = control_namespace

      iterator = Iterator.build(control_seed, control_namespace)

      is_namespace = iterator.namespace?(namespace)

      test do
        assert(is_namespace)
      end
    end

    context "Given Namespace Doesn't Correspond With Iterator's Namespace" do
      context "Iterator Has a Different Namespace" do
        namespace = Controls::Namespace.other_example

        iterator = Iterator.build(control_seed, control_namespace)

        is_namespace = iterator.namespace?(namespace)

        test do
          refute(is_namespace)
        end
      end

      context "Iterator Doesn't Have a Namespace" do
        iterator = Iterator.build(control_seed)

        is_namespace = iterator.namespace?(control_namespace)

        test do
          refute(is_namespace)
        end
      end
    end
  end
end
