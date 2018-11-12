require "test_helper"

class ExamTest < ActiveSupport::TestCase
	test "Create a valid exam" do 
		p = Patient.new(name: "Maria de Jesus", email: "mj@yahoo.com", phone: "113334-7070", birth_date: 13-02-1960, gender: "F")
    p.save
		exam = Exam.new(exam_type: "Exome", exam_date: 13-11-2018, patient_id:1)
		assert exam.save
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
