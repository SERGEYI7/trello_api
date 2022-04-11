class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content

      t.timestamps
    end
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :card, foreign_key: true

  end
end
