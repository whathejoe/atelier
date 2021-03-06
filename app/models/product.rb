class Product < ActiveRecord::Base
	

  	rails_admin do
		field :name
		field :price
		field :description
		field :image
  	end

  	has_attached_file :image, styles: { large: "1000x1000>", medium: "300x300>", thumb: "150x150>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
