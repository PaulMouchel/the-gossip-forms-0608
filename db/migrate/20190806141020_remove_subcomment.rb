class RemoveSubcomment < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :parent_id
    remove_column :comments, :parent_type
    add_column :comments, :gossip_id, :integer
  end
end
