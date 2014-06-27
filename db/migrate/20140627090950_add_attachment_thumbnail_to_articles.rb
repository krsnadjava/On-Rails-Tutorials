class AddAttachmentThumbnailToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    drop_attached_file :articles, :thumbnail
  end
end
