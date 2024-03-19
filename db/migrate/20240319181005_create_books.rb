class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :editorial
      t.integer :year
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
