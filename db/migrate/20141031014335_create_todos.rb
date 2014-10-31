class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :description
      t.integer :time_left
      t.integer :complete
      t.references :list, index: true

      t.timestamps
    end
  end
end
