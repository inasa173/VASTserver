class CreateCampaigncuepoints < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns_cuepoints, id: false do |t|
      t.references :cuepoint, foreign_key: false, null: false
      t.references :campaign, foreign_key: false, null: false
    end
  end
end
