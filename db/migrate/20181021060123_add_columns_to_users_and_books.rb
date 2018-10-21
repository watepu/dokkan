class AddColumnsToUsersAndBooks < ActiveRecord::Migration[5.1]
  def change
    change_column_null :books, :title, false, 0
    change_column_null :books, :headline, false, 0
    change_column_null :books, :content, false, 0
    change_column_null :users, :name, false, 0
    change_column_null :users, :image, false, 0
  end
end
