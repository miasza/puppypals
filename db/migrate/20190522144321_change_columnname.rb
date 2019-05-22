class ChangeColumnname < ActiveRecord::Migration[5.2]
  def change
    rename_column :visits, :time, :date
  end
end
