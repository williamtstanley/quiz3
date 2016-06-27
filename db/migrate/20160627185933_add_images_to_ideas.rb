class AddImagesToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :images, :json
  end
end
