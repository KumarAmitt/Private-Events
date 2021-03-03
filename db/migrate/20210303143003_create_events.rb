class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :event_date
      t.references :creator, foreign_key: true

      t.timestamps
    end
  end
end
