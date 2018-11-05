class Patient < ApplicationRecord
		has_many :exams
		validates :name, :email, :phone, :birth_date, :gender, presence: true 
		validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
		validates :phone, format: {with:  /\d[0-9]\)*\z/} 

end
