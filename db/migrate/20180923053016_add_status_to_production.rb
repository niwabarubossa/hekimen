class AddStatusToProduction < ActiveRecord::Migration[5.0]
  def change
    add_column :productions, :status, :boolean, default: true, null: false
  end
end
