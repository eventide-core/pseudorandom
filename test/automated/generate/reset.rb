require_relative '../automated_init'

context "Generate" do
  context "Reset" do
    context "Optional Namespace Omitted" do
      generate = Generate.new

      generate.iterator.next
      refute(generate.reset?)

      generate.reset

      test "Generator is reset" do
        assert(generate.reset?)
      end
    end

    context "Optional Namespace Given" do
      namespace = Controls::Namespace.example

      generate = Generate.new

      generate.iterator.next
      refute(generate.reset?)

      generate.reset(namespace)

      test "Generator is reset with the given namespace" do
        assert(generate.reset?(namespace))
      end
    end
  end
end
