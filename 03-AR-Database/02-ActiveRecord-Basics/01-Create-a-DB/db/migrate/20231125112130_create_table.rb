class CreateTable < ActiveRecord::Migration[7.0]
    def change
      create_table :table do |t|
        t.string :name
        t.timestamps
      end
    end
  end