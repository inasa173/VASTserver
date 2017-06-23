class CreateCuepoints < ActiveRecord::Migration[5.0]
  def change
    create_table :cuepoints do |t|
      t.int :id
      t.string :name

      t.timestamps
    end
  end
end
