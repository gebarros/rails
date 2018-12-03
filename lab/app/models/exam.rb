class Exam < ApplicationRecord
    belongs_to :patient
		has_one :sample
    validates :exam_type, :exam_date, presence: true
    validates :exam_type, inclusion: %w(Exoma Painel Paternidade)
end
