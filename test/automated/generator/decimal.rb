require_relative '../automated_init'

context "Generator" do
  context "Decimal" do
    seed = Controls::Seed.example
    generator = Generator.build(seed)

    control_sequence = Controls::Sequence::Decimal.example

    control_sequence.each.with_index(1) do |control_value, iteration|
      context "Iteration ##{iteration}" do
        value = generator.decimal

        comment("%0.16E" % value)
        detail("Control: %0.16E" % control_value)

        test do
          assert(value == control_value)
        end
      end
    end
  end
end
