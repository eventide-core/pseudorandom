require_relative '../automated_init'

context "Generator" do
  context "Integer" do
    control_seed = Controls::Seed.example
    generator = Generator.new(control_seed)

    control_sequence = Controls::Sequence::Integer.example

    control_sequence.each.with_index(1) do |control_integer, iteration|
      context "Iteration ##{iteration}" do
        integer = generator.integer

        comment "#{integer}"
        detail "Control: #{control_integer}"

        test do
          assert(integer == control_integer)
        end
      end
    end
  end
end
