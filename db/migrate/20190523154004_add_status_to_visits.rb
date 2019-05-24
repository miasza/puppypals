class AddStatusToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :status, :string, default: "pending"
  end
end
