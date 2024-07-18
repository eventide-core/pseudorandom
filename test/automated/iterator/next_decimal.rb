require_relative '../automated_init'

context "Iterator" do
  context "Next Decimal" do
    seed = Controls::Seed.example
    iterator = Iterator.build(seed)

    control_sequence = Controls::Sequence::Decimal.example

    control_sequence.each.with_index(1) do |control_value, iteration|
      context "Iteration ##{iteration}" do
        value = iterator.next_decimal

        comment("%0.16E" % value)
        detail("Control: %0.16E" % control_value)

        test do
          assert(value == control_value)
        end
      end
    end
  end
end
