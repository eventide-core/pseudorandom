require_relative '../automated_init'

context "Iterator" do
  context "Next Value" do
    seed = Controls::Seed.example
    iterator = Iterator.build(seed)

    control_sequence = Controls::Sequence.example

    control_sequence.each.with_index(1) do |control_value, iteration|
      context "Iteration ##{iteration}" do
        value = iterator.next

        comment("0x%016X" % value.unpack1('Q>'))
        detail("Control: 0x%016X" % control_value.unpack1('Q>'))

        test do
          assert(value == control_value)
        end
      end
    end
  end
end
