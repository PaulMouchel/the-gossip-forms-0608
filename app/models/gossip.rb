class Gossip < ApplicationRecord
  validates :title, presence: true, length: { in: 3..14 }
  validates :content, presence: true
	belongs_to :user
	has_many :join_table_gossip_tags
  has_many :tags, through: :join_table_gossip_tags, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def pre_like(user)
    self.likes.find { |like| like.user_id == user.id}
  end
end
