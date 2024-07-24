require_relative 'automated_init'

context "Reset" do
  singleton_generator = Pseudorandom::Generator.instance

  singleton_generator.integer

  Pseudorandom.reset

  test "Resets the singleton instance" do
    assert(singleton_generator.reset?)
  end
end
