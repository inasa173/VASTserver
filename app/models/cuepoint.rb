class Cuepoint < ApplicationRecord  

  validates :name, presence: true,
                   length: { maximum: 20, minimum: 5 },
                   uniqueness: { case_sensitive: false }
                   
  has_and_belongs_to_many :campaigns
  has_many :results
  # has_many :results, dependent: :destroy
  # has_many :campaigns, through: :results
end
