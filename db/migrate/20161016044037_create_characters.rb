class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :description
      t.integer :action, default: 0

      t.timestamps null: false
    end
  end
end
