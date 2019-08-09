class ModifyMessages < ActiveRecord::Migration[5.2]
  def change
  	remove_column :private_messages, :recipient_id
  	add_column :private_messages, :conversation_id, :integer
  end
end
