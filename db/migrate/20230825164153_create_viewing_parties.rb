class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.integer :movie, null: false
      t.interval :duration
      t.date :date
      t.time :start_time

      t.timestamps
    end
  end
end
