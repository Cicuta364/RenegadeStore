class AddRoleToUser < ActiveRecord::Migration
  def up
    add_column :users, :role, :integer, :default:1, null: false
  end
  def down
  	change_column :users, :role, :integer, default: nil, null: true
  end

end
