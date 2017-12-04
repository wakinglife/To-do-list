class RenameCheckedInTodos < ActiveRecord::Migration[5.1]
  def change
    rename_column :todos, :checked, :done
  end
end
