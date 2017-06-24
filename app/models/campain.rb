class Campain < ApplicationRecord
  validates :name, presence: true, 
                   length: { maximum: 20, minimum: 5 }
                   uniqueness: { case_sensitive: false }

  validates :start_at,
            :end_at, 
              presence: true,
              if: :correct_set_time?

  validates :limit_start, presence: true,
                          greater_than: 0,
                          less_than: 10000

  validates :movie_url, persence: true, 
                        length: { maxmum: 100, minimum: 5 }

  def correct_set_time?
    start_at < end_at
  end
end
