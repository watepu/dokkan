class ChangeColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :image, :text, null: true
  end
end
