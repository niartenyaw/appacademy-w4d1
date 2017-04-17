class AddUsernameAdRemoveNameAndEmailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string, null: false, default: 'test'
    remove_column :users, :email
    remove_column :users, :name
  end
end
