require "test_helper"

class SampleTest < ActiveSupport::TestCase
	test "Create a valid sample" do 
		p = Patient.new(name: "Maria de Jesus", email: "mj@yahoo.com", phone: "113334-7070", birth_date: 13-02-1960, gender: "F")
    p.save
		exam = Exam.new(exam_type: "Exome", exam_date: 13-11-2018, patient_id:1)
		exam.save
		sample = Sample.new(sample_type: "Sangue", collect_date: 13-11-2018, exam_id:1)
		assert sample.save
	end

	test "Cannot create sample with sample_type blank" do
    sample = Sample.new(sample_type: "")
		assert_not sample.save
		assert sample.errors.added? :sample_type, :blank  
	end

	test "Cannot create sample with collect_date blank" do
    sample = Sample.new(collect_date: "")
		assert_not sample.save
		assert sample.errors.added? :collect_date, :blank  
	end

end 
