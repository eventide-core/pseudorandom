require_relative '../../automated_init'

context "Generator" do
  context "Reset Predicate" do
    control_seed = Controls::Seed.example

    context "Is Reset" do
      context "Has Iterated" do
        generator = Generator.new(control_seed)

        generator.iterator.next

        generator.reset

        test do
          assert(generator.reset?)
        end
      end

      context "Hasn't Iterated" do
        generator = Generator.new(control_seed)

        test do
          assert(generator.reset?)
        end
      end
    end

    context "Isn't Reset" do
      context "Has Iterated" do
        generator = Generator.new(control_seed)

        generator.iterator.next

        test do
          refute(generator.reset?)
        end
      end
    end
  end
end
