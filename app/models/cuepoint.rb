class Cuepoint < ApplicationRecord  

  validates :name, presence: true,
                   length: { maximum: 20, minimum: 5 },
                   uniqueness: { case_sensitive: false }
                   
  has_many :cam_cues, dependent: :destroy
  has_many :campaigns, through: :cam_cues
  has_many :results, dependent: :destroy
  has_many :campaigns, through: :results
end
