require_relative '../automated_init'

context "Generator" do
  context "Boolean" do
    control_seed = Controls::Seed.example
    generator = Generator.new(control_seed)

    control_sequence = Controls::Sequence::Boolean.example

    control_sequence.each.with_index(1) do |control_boolean, iteration|
      context "Iteration ##{iteration}" do
        boolean = generator.boolean

        comment "#{boolean}"
        detail "Control: #{control_boolean}"

        test do
          assert(boolean == control_boolean)
        end
      end
    end
  end
end
