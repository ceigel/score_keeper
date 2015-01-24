class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.reference :player
      t.integer :value

      t.timestamps
    end
  end
end
