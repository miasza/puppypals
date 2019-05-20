class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.date :date
      t.references :user, foreign_key: true
      t.references :dog, foreign_key: true

      t.timestamps
    end
  end
end
