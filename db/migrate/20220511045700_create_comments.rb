class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :board, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
