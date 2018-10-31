class Patient < ApplicationRecord
    has_many :exams
    has_many :samples, through :exams
end
