class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.float :rating
      t.integer :pages_read
      t.string :body
      t.integer :book_id
      t.timestamps
    end
  end
end
