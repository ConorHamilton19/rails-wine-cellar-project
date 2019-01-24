class CreateUserWines < ActiveRecord::Migration[5.2]
  def change
    create_table :user_wines do |t|
      t.boolean :uncorked, :default => false
      t.integer :user_id
      t.integer :wine_id

      t.timestamps
    end
  end
end
