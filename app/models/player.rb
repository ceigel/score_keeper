# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  game_id    :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_players_on_name  (name)
#

class Player < ActiveRecord::Base
  belongs_to :games
end
