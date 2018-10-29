class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :exam_type
      t.date :exam_date
      t.date :delivery_date

      t.timestamps
    end
  end
end
