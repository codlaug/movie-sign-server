class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string     :video_id
      t.references :episode
      t.string     :title

      t.timestamps
    end

    add_index :videos, :episode_id
  end
end
