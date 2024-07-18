require_relative '../../automated_init'

context "Iterator" do
  context "Reset Predicate" do
    context "Optional Namespace Given" do
      control_namespace = Controls::Namespace.example

      iterator = Iterator.new
      iterator.namespace = control_namespace

      context "Namespace Corresponds With Generator's Namespace" do
        namespace = control_namespace

        reset = iterator.reset?(namespace)

        test "Reset" do
          assert(reset)
        end
      end

      context "Namespace Doesn't Correspond With Generator's Namespace" do
        namespace = Controls::Namespace.other_example

        reset = iterator.reset?(namespace)

        test "Not reset" do
          refute(reset)
        end
      end
    end
  end
end
