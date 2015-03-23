class Episode < ActiveRecord::Base
  has_many :videos

  def full_name
    "#{season} #{number} #{title}"
  end

  def number
    episode_number
  end

  def episode_string
    if episode_number < 10
      "#{season}0#{number}"
    else
      "#{season}#{number}"
    end
  end


  def link
    url || videos.first.link
  end
end
