class CamCue < ApplicationRecord
  belongs_to :campaign
  belongs_to :cuepoint

  validates :campaign_id, presence: true
  validates :cuepoint_id, presence: true
end
