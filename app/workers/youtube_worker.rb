class YoutubeWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily }

  def perform
    Episode.all.each do |episode|
      search_string = "mst3k #{episode.episode_string} #{episode.title}"

      search_results = YoutubeSearch.search(search_string)

      search_results.select! do |result|
        result['duration'].to_i > 5000 and
        result['title'].downcase.include?('mst3k')
      end

      search_results.each do |result|
        video = episode.videos.create video_id: result['video_id'], title: result['title']

        if episode.url.blank? and video.title.downcase.include?(episode.title.downcase)
          episode.update_attributes url: video.link
        end
      end

    end
  end
end