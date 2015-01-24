# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Game < ActiveRecord::Base
  has_many :players
  has_many :scores

  default_scope -> do
    order(created_at: :desc)
  end

  def player_names
    players.map{|p| p.name}.join("\n")
  end

  def player_names=(names)
    names.lines.each do |n|
      players.find_or_create_by(name: n.strip)
    end
  end
end
