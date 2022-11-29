class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.date :updatedAt
      t.date :createdAt

      t.timestamps
    end
  end
end
