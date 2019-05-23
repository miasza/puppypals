class ChangeDateColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :visits, :date, "date USING date::date"
  end
end
