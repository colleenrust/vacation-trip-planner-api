class RemoveEmailPasswordFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :emailpassword, :string
  end
end
