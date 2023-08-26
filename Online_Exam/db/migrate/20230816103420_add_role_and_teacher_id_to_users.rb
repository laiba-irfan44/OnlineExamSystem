class AddRoleAndTeacherIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer
    add_column :users, :teacher_id, :integer
    add_index :users, :teacher_id
  end
end
