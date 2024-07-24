require_relative '../automated_init'

context "Iterator" do
  context "Iterated Predicate" do
    control_seed = Controls::Seed.example

    context "Iterated" do
      context "Iterations Is Greater Than Zero" do 
        iterator = Iterator.build(control_seed)
        iterator.iterations = 1

        iterated = iterator.iterated?

        test do
          assert(iterated)
        end
      end
    end

    context "Not Iterated" do
      context "Iterations Is Zero" do 
        iterator = Iterator.build(control_seed)
        iterator.iterations = 0

        iterated = iterator.iterated?

        test do
          refute(iterated)
        end
      end
    end
  end
end
