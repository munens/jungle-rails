class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :description
      t.string :rating

      t.timestamps null: false
    end

    add_reference :reviews, :user
    add_reference :reviews, :product
  end
end
