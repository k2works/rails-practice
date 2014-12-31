# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  event_id   :integer
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  
  validates :comment, length: { maximum: 30 }, allow_blank: true
end
