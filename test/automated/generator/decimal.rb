require_relative '../automated_init'

context "Generator" do
  context "Decimal" do
    control_seed = Controls::Seed.example
    generator = Generator.new(control_seed)

    control_sequence = Controls::Sequence::Decimal.example

    control_sequence.each.with_index(1) do |control_decimal, iteration|
      context "Iteration ##{iteration}" do
        decimal = generator.decimal

        comment("%0.16E" % decimal)
        detail("Control: %0.16E" % control_decimal)

        test do
          assert(decimal == control_decimal)
        end
      end
    end
  end
end
