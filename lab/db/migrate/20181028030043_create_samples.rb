class CreateSamples < ActiveRecord::Migration[5.2]
  def change
    create_table :samples do |t|
      t.string :sample_type
      t.date :collect_date

      t.timestamps
    end
  end
end
