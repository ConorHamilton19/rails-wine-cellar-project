class CreateUserWines < ActiveRecord::Migration[5.2]
  def change
    create_table :user_wines do |t|
      t.integer :uncorked, :default => 0
      t.integer :user_id
      t.integer :wine_id

    end
  end
end
