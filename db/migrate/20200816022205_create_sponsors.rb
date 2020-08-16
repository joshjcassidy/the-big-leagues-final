class CreateSponsors < ActiveRecord::Migration[6.0]
  def change
    create_table :sponsors do |t|
      t.integer :placings
      t.integer :participants
      t.integer :tournaments
      t.integer :streamHours
      t.integer :minutesOfVideo

      t.timestamps
    end
  end
end
