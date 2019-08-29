class AddFieldBgUrlToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :bg_url, :string
  end
end
