class Sample < ApplicationRecord
		belongs_to :exam 
		validates :sample_type, :collect_date, presence: true 
		validates :sample_type, inclusion: %w(Sangue Swab)
end
