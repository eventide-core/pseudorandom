require_relative '../../automated_init'

context "Generate" do
  context "Reset Predicate" do
    context "Is Reset" do
      context "Hasn't Iterated" do
        iterator = Iterator.build

        generate = Generate.new
        generate.iterator = iterator

        test do
          assert(generate.reset?)
        end
      end
    end

    context "Isn't Reset" do
      context "Has Iterated" do
        iterator = Iterator.build
        iterator.next

        generate = Generate.new
        generate.iterator = iterator

        test do
          refute(generate.reset?)
        end
      end
    end
  end
end
