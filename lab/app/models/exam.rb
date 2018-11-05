class Exam < ApplicationRecord
    belongs_to :patient
		has_one :sample
		validates :exam_type, :exam_date, presence: true 
end
