class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :description
      t.string :grade
      t.string :subject
      t.string :content
    end
  end
end
