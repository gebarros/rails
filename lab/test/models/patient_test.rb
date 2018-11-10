require "test_helper"

class PatientTest < ActiveSupport::TestCase
  test "Create a valid patient" do
    patient = Patient.new(name: "Joao Ninguem", email: "joao@bol.br")
    assert patient.save
  end

  test "No patient name blank" do
    patient = Patient.new(name: "")
    assert_not patient.save
  end

  test "No patient email blank" do
    patient = Patient.new(email: "")
    assert_not patient.save
    assert patient.errors.added? :email, :blank
  end

  test "Email without @ is invalid" do
    patient = Patient.new(email: "joaoninguem")
    assert_not patient.save
    assert patient.errors.added? :email, :invalid
  end

  test "Cannot create patient when email host is invalid" do
    patient = Patient.new(email: "joaoninguem@host.c")
    assert_not patient.save
    assert patient.errors.added? :email, :invalid
  end

end
