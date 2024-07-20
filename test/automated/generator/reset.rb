require_relative '../automated_init'

context "Generator" do
  context "Reset" do
    context "Optional Namespace Omitted" do
      generator = Generator.new

      control_namespace = Controls::Namespace.example
      generator.namespace = control_namespace

      generator.iterator.next
      refute(generator.reset?)

      generator.reset

      test "Generator is reset" do
        assert(generator.reset?)
      end

      context "Generator's Namespace" do
        namespace = generator.namespace

        test "Unchanged" do
          assert(namespace == control_namespace)
        end
      end
    end

    context "Optional Namespace Given" do
      namespace = Controls::Namespace.example

      generator = Generator.new

      generator.iterator.next
      refute(generator.reset?)

      generator.reset(namespace)

      test "Generator is reset with the given namespace" do
        assert(generator.reset?(namespace))
      end
    end
  end
end
