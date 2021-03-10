class CreateTomogatchis < ActiveRecord::Migration[6.1]
  def change
    create_table :tomogatchis do |t|
      t.string :name
      t.integer :user_id
      t.integer :happiness_meter, :default => 60
      t.integer :hunger_meter, :default => 60
      t.integer :total_points
      t.boolean :alive, :default => true
      t.timestamps
    end
  end
end
