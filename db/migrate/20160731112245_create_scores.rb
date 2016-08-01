class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :correct_points
      t.integer :wrong_points
      t.integer :category_id 
      
      t.timestamps null: false
    end
  end
end
