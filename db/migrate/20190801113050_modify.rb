class Modify < ActiveRecord::Migration[5.2]
  def change
  	remove_column :comments, :gossip_or_comment_id
  	remove_column :comments, :gossip_or_comment_type
  	remove_column :comments, :gossip_id
  	add_column :comments, :parent_id, :integer
  	add_column :comments, :parent_type, :string
  end
end
