require_relative '../automated_init'

context "Generate" do
  context "String" do
    seed = Controls::Seed.example
    generate = Generate.build(seed)

    control_sequence = Controls::Sequence::String.example

    control_sequence.each.with_index(1) do |control_value, iteration|
      context "Iteration ##{iteration}" do
        value = generate.string

        comment "#{value}"
        detail "Control: #{control_value}"

        test do
          assert(value == control_value)
        end
      end
    end
  end
end
