class CreateCamCues < ActiveRecord::Migration[5.0]
  def change
    create_table :cam_cues do |t|
      t.references :campaign, foreign_key: true
      t.references :cuepoint, foreign_key: true
    end
  end
end
