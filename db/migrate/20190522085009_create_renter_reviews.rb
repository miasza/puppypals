class CreateRenterReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :renter_reviews do |t|
      t.references :dog, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :rating
      t.string :content

      t.timestamps
    end
  end
end
