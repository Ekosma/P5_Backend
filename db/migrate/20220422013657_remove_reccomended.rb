class RemoveReccomended < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :recommended
  end
end
