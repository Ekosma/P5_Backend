class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :recommended
      t.string :comment
      t.belongs_to :lesson, null: false, foreign_key: true
    end
  end
end
