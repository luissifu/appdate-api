class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :desc
      t.datetime :deadline
      t.references :category, index: true

      t.timestamps
    end
  end
end
