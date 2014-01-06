class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :times

      t.timestamps
    end
  end
end
