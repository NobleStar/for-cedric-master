class CreateOwnerInfos < ActiveRecord::Migration
  def change
    create_table :owner_infos do |t|
      t.text :video_url
      t.text :description
      t.text :timeline
      t.string :photo
      t.string :name
      t.text :biography
      t.string :location
      t.string :website
      t.integer :project_id
      t.integer :user_id
      t.text :owner_feedback
      t.timestamps
    end
  end
end
