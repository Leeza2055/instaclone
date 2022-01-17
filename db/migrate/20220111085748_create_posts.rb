class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :photo
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps null: false
    end
    add_index :posts, :user_id
  end
end
