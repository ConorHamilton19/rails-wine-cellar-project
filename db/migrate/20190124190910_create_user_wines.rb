class CreateUserWines < ActiveRecord::Migration[5.2]
  def change
    create_table :user_wines do |t|
      t.boolean :uncorked
      t.integer :user_id
      t.string :wine_id
      t.integer :

      t.timestamps
    end
  end
end
