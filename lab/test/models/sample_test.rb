require "test_helper"

class SampleTest < ActiveSupport::TestCase
	test "Create a valid sample" do
		p = Patient.create(
      birth_date: Date.new(1960, 2, 13),
      email: "mj@yahoo.com",
      gender: "F",
      name: "Maria de Jesus",
      phone: "113334-7070",
    )
		exam = p.exams.create(
      exam_date: Date.today,
      exam_type: "Exome"
    )
		sample = exam.build_sample(
      collect_date: Date.today,
      sample_type: "Sangue"
    )
		assert sample.save
  end

  test "Cannot create sample type different of: Sangue, Swab" do
    sample = Sample.new(sample_type: "Catota")
		assert_not sample.save
		assert sample.errors.added? :sample_type, :inclusion
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
