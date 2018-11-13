require "test_helper"

class ExamTest < ActiveSupport::TestCase
	test "Create a valid exam" do
		p = Patient.create(
      birth_date: Date.new(1960, 2, 13),
      email: "mj@yahoo.com",
      gender: "F",
      name: "Maria de Jesus",
      phone: "113334-7070"
    )
		exam = p.exams.build(exam_date: Date.today, exam_type: "Exome")
		assert exam.save
	end

	test "Cannot create an exam_type different of: Exome, Painel and Paternity" do
    exam = Exam.new(exam_type: "Glicemia")
    assert_not exam.save
    assert exam.errors.added? :exam_type, :inclusion
  end

	test "Cannot create exam with exam_type blank" do
    exam = Exam.new(exam_type: "")
		assert_not exam.save
		assert exam.errors.added? :exam_type, :blank
	end

	test "Cannot create exam with exam_date blank" do
    exam = Exam.new(exam_date: "")
		assert_not exam.save
		assert exam.errors.added? :exam_date, :blank
	end

end
