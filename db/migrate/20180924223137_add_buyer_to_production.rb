class AddBuyerToProduction < ActiveRecord::Migration[5.0]
  def change
    add_column :productions, :buyer, :integer
    add_column :productions, :seller, :integer
  end
end
