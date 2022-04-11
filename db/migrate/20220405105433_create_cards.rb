class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    
    add_reference :cards, :user, foreign_key: true
    add_reference :cards, :column, foreign_key: true
  end
end
