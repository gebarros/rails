class Sample < ApplicationRecord
		belongs_to :exam 
		validates :sample_type, :collect_date, presence: true 
end
