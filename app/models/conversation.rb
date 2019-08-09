class Conversation < ApplicationRecord
	has_many :join_table_users_conversation
	has_many :users, through: :join_table_users_conversation
	has_many :private_messages
end
