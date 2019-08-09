class CreateJoinTableUsersConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_users_conversations do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :conversation, index: true
      t.timestamps
    end
  end
end
