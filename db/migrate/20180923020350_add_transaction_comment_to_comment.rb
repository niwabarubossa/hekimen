class AddTransactionCommentToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :transaction_comment,:boolean, default: false, null: false
  end
end
