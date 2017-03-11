class CreateQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :queues do |t|
      t.string :name
      t.text :description
      t.integer :maxUsers
      
      t.timestamps
    end
  end
end
