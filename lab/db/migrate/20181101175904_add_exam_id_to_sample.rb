class AddExamIdToSample < ActiveRecord::Migration[5.2]
  def change
    add_reference :samples, :exam, foreign_key: true
  end
end
