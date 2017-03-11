class CreateAdminsToQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :admins_to_queues do |t|
      t.integer :queueId
      t.integer :adminId

      t.timestamps
    end
  end
end
