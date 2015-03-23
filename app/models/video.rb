class Video < ActiveRecord::Base

  belongs_to :episode

  validates :video_id, presence: true, uniqueness: { scope: :episode_id }
  validates :episode, presence: true
  validates :title, presence: true

  def link
    "http://www.youtube.com/watch?v=#{video_id}"
  end
end
