class CreateColumns < ActiveRecord::Migration[7.0]
  def change
    create_table :columns do |t|
      t.string :name

      t.timestamps
    end

      add_reference :columns, :user, foreign_key: true
  end
end
