class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :author, foreign_key: { to_table: 'users' }, null: false, index: true 
      t.references :post, foreign_key: true 

      t.timestamps
    end
  end
end