require_relative '../automated_init'

context "Generate" do
  context "Decimal" do
    seed = Controls::Seed.example
    generate = Generate.build(seed)

    control_sequence = Controls::Sequence::Decimal.example

    control_sequence.each.with_index(1) do |control_value, iteration|
      context "Iteration ##{iteration}" do
        value = generate.decimal

        comment("%0.16E" % value)
        detail("Control: %0.16E" % control_value)

        test do
          assert(value == control_value)
        end
      end
    end
  end
end
