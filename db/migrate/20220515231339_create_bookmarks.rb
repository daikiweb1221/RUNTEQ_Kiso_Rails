class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :board, foreign_key: true

      t.timestamps
    end
    add_index  :bookmarks, [:user_id, :board_id], unique: true # user_id と board_idの組み合わせを一意性のあるものにしている
  end
end
