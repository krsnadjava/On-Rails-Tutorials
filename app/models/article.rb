class Article < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	validates :title, presence: true,
                    length: { minimum: 5 }
    def method1
    	puts "This is method 1"
    end

    def self.method1
    	puts "This is self method"
    end
end
