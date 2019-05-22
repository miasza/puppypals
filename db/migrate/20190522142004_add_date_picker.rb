class AddDatePicker < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :time, :string
  end
end
