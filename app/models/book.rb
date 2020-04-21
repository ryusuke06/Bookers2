class Book < ApplicationRecord
		belongs_to :user #user　が1対Nの１にあたるので単数形
	    attachment :profile_image

	    validates :title, :body, presence: true, length: { maximum: 200 }
end
