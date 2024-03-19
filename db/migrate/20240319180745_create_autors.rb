class CreateAutors < ActiveRecord::Migration[7.1]
  def change
    create_table :autors do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
