class RenameAssignmentsToUserRoles < ActiveRecord::Migration
  def change
    rename_table :assignments, :user_roles
  end
end
