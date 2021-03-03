class CreatePorts < ActiveRecord::Migration[5.2]
  def change
    create_table :ports do |t|
      t.string :name
      t.boolean :busy, default: false

      t.timestamps
    end
  end
end
