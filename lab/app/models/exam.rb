class Exam < ApplicationRecord
    belongs_to :patient
    has_one :sample
end
