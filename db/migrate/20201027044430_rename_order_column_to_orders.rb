class RenameOrderColumnToOrders < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :order_id, :item_id
  end
end
