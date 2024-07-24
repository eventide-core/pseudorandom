require_relative '../automated_init'

context "Generator" do
  context "String" do
    control_seed = Controls::Seed.example
    generator = Generator.new(control_seed)

    control_sequence = Controls::Sequence::String.example

    control_sequence.each.with_index(1) do |control_value, iteration|
      context "Iteration ##{iteration}" do
        value = generator.string

        comment "#{value}"
        detail "Control: #{control_value}"

        test do
          assert(value == control_value)
        end
      end
    end
  end
end
