require_relative '../automated_init'

context "Generator" do
  context "Boolean" do
    seed = Controls::Seed.example
    generator = Generator.build(seed)

    control_sequence = Controls::Sequence::Boolean.example

    control_sequence.each.with_index(1) do |control_value, iteration|
      context "Iteration ##{iteration}" do
        value = generator.boolean

        comment "#{value}"
        detail "Control: #{control_value}"

        test do
          assert(value == control_value)
        end
      end
    end
  end
end
