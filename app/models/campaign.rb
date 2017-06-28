class Campaign < ApplicationRecord
  validates :name, presence: true, 
                   length: { maximum: 20, minimum: 5 },
                   uniqueness: { case_sensitive: false }

  validates_datetime :start_at, presence: true, on_or_after: :current_time
  validates_datetime :end_at, presence: true, after: :start_at
            

  validates :limit_start, presence: true,
                         numericality: { 
                           only_integer: true,
                          greater_than_equal_to: 0,
                          less_than_equal_to: 10000
                           }

  validates :movie_url, length: { maximum: 100, minimum: 5 }

  has_many :cuepoints
end
