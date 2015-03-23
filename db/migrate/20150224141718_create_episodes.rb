class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer    :season
      t.integer    :episode_number
      t.string     :title
      t.string     :url
      t.timestamps
    end
  end
end
