class Patient < ApplicationRecord
    has_many :exam
    has_many :sample
end
