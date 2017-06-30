class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :name, presence: true
      t.datetime :start_at, presence: true
      t.datetime :end_at, presence: true
      t.integer :limit_start, presence: true
      t.string :movie_url, presence: true

      t.timestamps
    end
  end
end
