class AddApprovedToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :approved, :integer
  end
end
