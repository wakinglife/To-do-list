class UpdateColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :todos, :date, :due_date
  end
end
