class CreateCreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :create_comments do |t|
      t.string :text
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
