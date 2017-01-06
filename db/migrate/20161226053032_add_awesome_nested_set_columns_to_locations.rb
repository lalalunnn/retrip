class AddAwesomeNestedSetColumnsToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :parent_id, :integer
    add_column :locations, :lft, :integer
    add_column :locations, :rgt, :integer

    add_column :locations, :depth, :integer
    add_column :locations, :children_count, :integer

    add_index :locations, :parent_id
    add_index :locations, :lft
    add_index :locations, :rgt

    add_index :locations, :depth
  end
end
