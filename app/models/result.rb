class Result < ApplicationRecord
  belongs_to :campaign
  belongs_to :cuepoint

  validates :count_start,
            :count_complete, numericality: {
                        only_integer: true,
                        greater_then_or_equal_to: 0
                        } 
  validates :campaign_id,
            :cuepoint_id, presence: true
end
