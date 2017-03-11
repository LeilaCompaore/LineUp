class CreateLinersToQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :liners_to_queues do |t|
      t.integer :queueId
      t.integer :linerId

      t.timestamps
    end
  end
end
