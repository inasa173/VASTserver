class CreateCampains < ActiveRecord::Migration[5.0]
  def change
    create_table :campains do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.integer :limit_start
      t.string :movie_url

      t.timestamps
    end
  end
end
