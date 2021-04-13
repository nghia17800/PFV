class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :address, :string
    add_column :users, :age, :integer
    add_column :users, :job, :integer
    add_column :users, :role, :integer
    add_column :users, :phone_number, :integer
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :image, :string
  end
end
