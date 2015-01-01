# coding: utf-8
require 'rails_helper'

RSpec.describe Event, :type => :model do
   describe '#name' do
	  context 'nilのとき' do
		 let(:event) { Event.new(name: nil) }

		 it 'validでないこと' do
			event.valid?
			expect(event.errors[:name]).to be_present
		 end
	  end
	  context '空白のとき' do
		 let(:event) { Event.new(name: '') }
		 
		 it 'valid でないこと' do
			event.valid?
			expect(event.errors[:name]).to be_present
		 end
	  end
	  context 'Rails勉強会のとき' do
		 let(:event) { Event.new(name: 'Rails勉強会') }
		 
		 it 'valid であること' do
			event.valid?
			expect(event.errors[:name]).to be_blank
		 end
	  end
	  context '50文字のとき' do
		 let(:event) { Event.new(name: 'a' * 50) }
		 
		 it 'valid であること' do
			event.valid?
			expect(event.errors[:name]).to be_blank
		 end
	  end
	  context '51文字のとき' do
		 let(:event) { Event.new(name: 'a' * 51) }
		 
		 it 'valid でないこと' do
			event.valid?
			expect(event.errors[:name]).to be_present
		 end
	  end
   end
   # Shoulda-matchers適用
   describe '#name' do
	  it { should validate_presence_of(:name) }
	  it { should ensure_length_of(:name).is_at_most(50) }	  
   end

   describe '#created_by?' do
	  let(:event) { create(:event) }
	  subject { event.created_by?(user) }

	  context '引数がnilなとき' do
		 let(:user) { nil }
		 it { should be_falsey }
	  end

	  context '#owner_idと引数の#idが同じとき' do
		 let(:user) { double('user', id: event.id )}
		 it { should be_truthy }
	  end
   end
end
