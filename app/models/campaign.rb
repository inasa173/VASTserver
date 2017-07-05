class Campaign < ApplicationRecord
  
  validates :name, presence: true, 
                   length: { maximum: 20, minimum: 5 },
                   uniqueness: { case_sensitive: false }

  validates_datetime :start_at, presence: true, on_or_after: :current_time
  validates_datetime :end_at, presence: true, after: :start_at
            

  validates :limit_start, presence: true,
                          numericality: { 
                            only_integer: true,
                            greater_than: 0,
                            less_than_or_equal_to: 10000
                          }

  validates :movie_url, length: { maximum: 100, minimum: 5 }

  has_and_belongs_to_many :cuepoints
  has_many :results
  # has_many :results, dependent: :destroy
  # has_many :cuepoints, through: :results
  
  def self.current_avaliable(cuepoint)
    campaigns = cuepoint.campaigns.where("start_at <= '#{Time.now}' AND end_at >= '#{Time.now}'").to_a
    campaigns.delete_if do |campaign|
      result = Result.where(campaign: campaign, cuepoint: @cuepoint).first
      !result.blank? && result.count_start >= campaign.limit_start
    end
    campaigns
  end
end
