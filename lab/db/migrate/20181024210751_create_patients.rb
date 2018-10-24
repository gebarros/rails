class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.date :birth_date
      t.string :address
      t.string :address_number
      t.string :address_complement
      t.string :city
      t.string :address_uf
      t.string :phone
      t.string :gender

      t.timestamps
    end
  end
end
