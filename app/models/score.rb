# == Schema Information
#
# Table name: scores
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Score < ActiveRecord::Base
  belongs_to :games
end
