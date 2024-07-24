require_relative 'automated_init'

context "String" do
  singleton_generator = Pseudorandom::Generator.instance
  singleton_generator.reset

  control_integer = singleton_generator.integer

  singleton_generator.reset

  integer = Pseudorandom.integer

  comment "#{integer}"
  detail "Control: #{control_integer}"

  test do
    assert(integer == control_integer)
  end
end
