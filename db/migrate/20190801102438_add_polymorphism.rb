class AddPolymorphism < ActiveRecord::Migration[5.2]
  def change
  	add_column :comments, :gossip_or_comment_id, :integer
  	add_column :comments, :gossip_or_comment_type, :string
  end
end
