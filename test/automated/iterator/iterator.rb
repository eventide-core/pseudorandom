require_relative '../automated_init'

context "Iterator" do
  control_seed = Controls::Seed.example
  iterator = Iterator.build(control_seed)

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

  context "Iterations" do
    iterations = iterator.iterations
    control_iterations = control_sequence.count

    comment iterations.inspect
    detail "Control: #{control_iterations.inspect}"

    increased = iterations == control_iterations

    test "Increased" do
      assert(increased)
    end
  end
end
