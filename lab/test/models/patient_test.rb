require "test_helper"

class PatientTest < ActiveSupport::TestCase
  test "Create a valid patient" do
		patient = Patient.new(name: "Joao Ninguem", email: "joao@bol.br", phone: "1198372-7994",
		birth_date: 13-07-1970, gender: "M")
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
	
	test "No patient phone blank" do
    patient = Patient.new(phone: "")
		assert_not patient.save
    assert patient.errors.added? :phone, :blank
	end
	
	test "Cannot create patient when phone is invalid" do
    patient = Patient.new(phone: "abcdef")
		assert_not patient.save
    assert patient.errors.added? :phone, :invalid
	end
	
	test "No patient birth date blank" do
    patient = Patient.new(birth_date: "")
		assert_not patient.save
    assert patient.errors.added? :birth_date, :blank
	end

	test "No patient gender blank" do
    patient = Patient.new(gender: "")
		assert_not patient.save
    assert patient.errors.added? :gender, :blank
	end
end
