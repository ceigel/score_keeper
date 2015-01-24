class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.belongs_to :game

      t.timestamps
    end
    add_index :players, :name
  end
end
