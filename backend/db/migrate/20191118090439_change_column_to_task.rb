class ChangeColumnToTask < ActiveRecord::Migration[6.0]
  def up
    change_column :tasks, :title, :string, null: false, default: '', limit: 25
  end

  def down
    change_column :tasks, :title, :string
  end
end
