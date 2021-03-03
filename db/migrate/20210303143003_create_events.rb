class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :event_date
      t.index :creator_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
