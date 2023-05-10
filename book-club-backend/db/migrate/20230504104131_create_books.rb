class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :blurb
      t.string :image_url
      t.boolean :read
      t.timestamps
    end
  end
end
