class CreateQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :queuees do |t|
      t.string :name
      t.text :description
      t.integer :maxUsers

      t.timestamps
    end
    # rename_table (:queues, :queuees)
    # rename_table(:queuees, :queues)
  end
end
