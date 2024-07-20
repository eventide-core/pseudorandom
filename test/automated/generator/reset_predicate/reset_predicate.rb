require_relative '../../automated_init'

context "Generator" do
  context "Reset Predicate" do
    context "Is Reset" do
      context "Hasn't Iterated" do
        iterator = Iterator.build

        generator = Generator.new
        generator.iterator = iterator

        test do
          assert(generator.reset?)
        end
      end
    end

    context "Isn't Reset" do
      context "Has Iterated" do
        iterator = Iterator.build
        iterator.next

        generator = Generator.new
        generator.iterator = iterator

        test do
          refute(generator.reset?)
        end
      end
    end
  end
end
