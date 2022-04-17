class EditContentType < ActiveRecord::Migration[6.1]
  def change
    change_column :lessons, :content, :binary
  end
end
