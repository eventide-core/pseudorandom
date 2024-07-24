require_relative 'automated_init'

context "String" do
  singleton_generator = Pseudorandom::Generator.instance
  singleton_generator.reset

  control_string = singleton_generator.string

  singleton_generator.reset

  string = Pseudorandom.string

  comment string.inspect
  detail "Control: #{control_string.inspect}"

  test do
    assert(string == control_string)
  end
end
