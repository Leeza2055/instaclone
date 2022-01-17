class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    validates :body, presence: true
    delegate :email, to: :user, prefix: true
end
