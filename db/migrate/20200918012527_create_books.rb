class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :Title
      t.string :Genre
      t.string :Author
      t.float :Price
      t.date :Published

      t.timestamps
    end
  end
end
