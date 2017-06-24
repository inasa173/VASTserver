class Result < ApplicationRecord

  validates :count_start,
            :count_end, only_integer: true,
                        greater_then_or_equal_to: 0
  validates :campaign_id,
            :cuepoint_id, presence: true
end
