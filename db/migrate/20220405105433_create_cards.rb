class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :column_id
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
