class AddDescriptionFieldToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :description, :text
    add_column :blogs, :views, :integer, default: 0
  end
end
