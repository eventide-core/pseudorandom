require_relative 'automated_init'

context "Decimal" do
  singleton_generator = Pseudorandom::Generator.instance
  singleton_generator.reset

  control_decimal = singleton_generator.decimal

  singleton_generator.reset

  decimal = Pseudorandom.decimal

  comment("%0.16E" % decimal)
  detail("Control: %0.16E" % control_decimal)

  test do
    assert(decimal == control_decimal)
  end
end
