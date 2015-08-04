class CreateTraders < ActiveRecord::Migration
  def change
    create_table :traders do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :traders, :name, :unique => true
  end
end
