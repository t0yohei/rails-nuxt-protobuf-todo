class AddDescriptionToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :description, :string, limit: 100
  end
end
