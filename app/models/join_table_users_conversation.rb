class JoinTableUsersConversation < ApplicationRecord
	belongs_to :user
	belongs_to :conversation
end
