class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :name
      t.integer :year
      t.integer :price
      t.integer :type_id

      t.timestamps
    end
  end
end
