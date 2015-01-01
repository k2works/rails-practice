# coding: utf-8
# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  owner_id    :integer
#  name        :string
#  place       :string
#  start_time  :datetime
#  end_time    :datetime
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  event_image :string
#

FactoryGirl.define do
  factory :event do
     owner
	 sequence(:name) { |i| "イベント名#{i}" }
	 sequence(:place) { |i| "イベント開催場所#{i}" }
	 sequence(:content) { |i| "イベント本文#{i}"}
	 start_time { rand(1..30).days.from_now }
	 end_time { start_time + rand(1..30).hours }
  end

end
