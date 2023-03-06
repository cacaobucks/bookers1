class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :year_published
      t.timestamps
      add_column :books, :body, :text
    end
  end
end