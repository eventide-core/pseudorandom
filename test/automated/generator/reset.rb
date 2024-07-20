require_relative '../automated_init'

context "Generator" do
  context "Reset" do
    context "Optional Namespace Omitted" do
      generator = Generator.new

      generator.iterator.next
      refute(generator.reset?)

      generator.reset

      test "Generator is reset" do
        assert(generator.reset?)
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
