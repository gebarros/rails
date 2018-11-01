class AddPatientIdToExam < ActiveRecord::Migration[5.2]
  def change
    add_reference :exams, :patient, foreign_key: true
  end
end
