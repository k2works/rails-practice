# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  provider   :string
#  uid        :string
#  nickname   :string
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :user, aliases: [:owner] do
     provider 'twitter'
	 sequence(:uid) { |i| "uid#{i}" }
	 sequence(:nickname) { |i| "nickname#{i}" }
	 sequence(:image_url) { |i| "http://example.com/image#{i}.jpg" }
  end

end
