class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.references :video, index: true, foreign_key: true
      t.timestamps
    end
  end
end
