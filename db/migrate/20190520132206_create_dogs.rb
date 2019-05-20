class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.string :size
      t.integer :price
      t.string :photo
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
