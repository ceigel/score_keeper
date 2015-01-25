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
  belongs_to :game, inverse_of: :players
  has_many :scores, inverse_of: :player, dependent: :destroy, autosave: true
end
