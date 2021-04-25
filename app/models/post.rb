class Post < ApplicationRecord
    has_many :forwards, :dependent => :destroy
    has_many :users, through: :forwards   

    accepts_nested_attributes_for :users
    accepts_nested_attributes_for :forwards
   # accepts_nested_attributes_for :users, reject_if: lambda { |attrs| attrs['user_id'].blank?}
	enum status: {draft: 0, published: 1}
    extend FriendlyId
    friendly_id :title, use: :slugged
end

