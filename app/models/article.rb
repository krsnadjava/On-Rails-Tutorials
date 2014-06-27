class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user
	validates :title, presence: true,
                    length: { minimum: 5 }
    
    has_attached_file :thumbnail, :styles => { :small => "150x150>" }
    validates_attachment :thumbnail, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

    def method1
    	puts "This is method 1"
    end

    def self.method1
    	puts "This is self method"
    end
end
