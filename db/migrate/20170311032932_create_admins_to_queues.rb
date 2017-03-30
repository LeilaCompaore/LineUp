class CreateAdminsToQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :admins_to_queues do |t|
      t.belongs_to :queuee, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
