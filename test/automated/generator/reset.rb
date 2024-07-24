require_relative '../automated_init'

context "Generator" do
  context "Reset" do
    control_seed = Controls::Seed.example

    context "Optional Namespace Omitted" do
      generator = Generator.new(control_seed)

      control_namespace = Controls::Namespace.example
      iterator = Iterator.build(control_seed, control_namespace)
      iterator.next

      generator.iterator = iterator

      generator.reset

      test "Generator is reset" do
        assert(generator.reset?)
      end

      context "Iterator's Namespace" do
        namespace = iterator.namespace

        test "Unchanged" do
          assert(namespace == control_namespace)
        end
      end
    end

    context "Optional Namespace Given" do
      namespace = Controls::Namespace.example

      generator = Generator.new(control_seed)

      control_namespace = Controls::Namespace.example
      iterator = Iterator.build(control_seed, control_namespace)
      iterator.next

      generator.iterator = iterator

      generator.reset(namespace)

      test "Generator is reset with the given namespace" do
        assert(generator.reset?(namespace))
      end
    end
  end
end
