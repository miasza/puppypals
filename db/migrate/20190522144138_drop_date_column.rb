class DropDateColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :visits, :date
  end
end
