require_relative '../../automated_init'

context "Iterator" do
  context "Reset Predicate" do
    context "Reset" do
      context "Sequence Is Not Incremented" do
        iterator = Iterator.new

        test do
          assert(iterator.reset?)
        end
      end

      context "Sequence Is Reset" do
        iterator = Iterator.new

        iterator.sequence = 0

        test do
          assert(iterator.reset?)
        end
      end
    end

    context "Not Reset" do
      context "Sequence Is Incremented" do
        iterator = Iterator.new

        iterator.sequence += 1

        test do
          refute(iterator.reset?)
        end
      end

      context "Seuence Is Greater Than Zero" do
        iterator = Iterator.new

        iterator.sequence = 11

        test do
          refute(iterator.reset?)
        end
      end
    end
  end
end
