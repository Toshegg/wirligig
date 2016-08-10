require 'rails_helper'

RSpec.describe Api::Rest::Meeting, type: :model do
  describe "validations" do
    context "when attributes is not present" do

      let(:meeting) { build :meeting, name: "", starts_at: "", lat: "", lng: "" }

      before do
        @result = meeting.valid?
      end

      it "should be invalid and have errors" do
        expect(@result).to eq(false)
        expect(meeting.errors.messages).to eq({ :name=>["can't be blank"],
                                                :starts_at=>["can't be blank"],
                                                :lat=>["can't be blank"],
                                                :lng=>["can't be blank"]
                                              })
      end
    end

  end

  
  describe 'ordered_by' do
    context 'when orders by name' do
      let(:meeting1) { create :meeting, name: '1' }
      let(:meeting2) { create :meeting, name: '2' }

      it 'should return ordered list' do
        expect(Api::Rest::Meeting.ordered_by(order: 'name')).to eq([meeting1, meeting2])
      end
    end

    context 'when orders by starts_at' do
      let(:meeting1) { create :meeting, starts_at: DateTime.now }
      let(:meeting2) { create :meeting, starts_at: DateTime.now + 2.days }

      it 'should return ordered list' do
        expect(Api::Rest::Meeting.ordered_by(order: 'starts_at')).to eq([meeting1, meeting2])
      end
    end 

    context 'when orders by distance' do
      let(:meeting1) { create :meeting, lat: 55.03923, lng: 82.927818 }
      let(:meeting2) { create :meeting, lat: 55.042827, lng: 82.936649 }

      it 'should return ordered list' do
        expect(Api::Rest::Meeting.ordered_by({ order: 'distance', lat: 55.029498, lng: 82.916822})).to eq([meeting1, meeting2])
      end
    end
  end

  describe 'filtered_by' do

    context 'name' do
      let(:meeting1) { create :meeting, name: 'first' }
      let(:meeting2) { create :meeting, name: 'second' }

      it 'should return only one meeting' do
        expect(Api::Rest::Meeting.filtered_by(name: 'fir')).to eq([meeting1])
      end
    end

    context 'games_ids' do
      let(:meeting1) { create :meeting }
      let(:meeting2) { create :meeting }

      let(:game1) { create :game }
      let(:game2) { create :game }

      before do
        meeting1.games << game1
        meeting2.games << game2
      end

      it 'should return only one meeting' do
        expect(Api::Rest::Meeting.filtered_by(games_ids: [game1.id])).to eq([meeting1])
      end
    end

    context 'hour_from' do
      let(:meeting1) { create :meeting, starts_at: '2015-11-11 12:03' }
      let(:meeting2) { create :meeting, starts_at: '2015-11-11 14:03' }

      it 'should return only one meeting' do
        expect(Api::Rest::Meeting.filtered_by(hour_from: 13)).to eq([meeting2])
      end
    end

    context 'hour_to' do
      let(:meeting1) { create :meeting, starts_at: '2015-11-11 12:03' }
      let(:meeting2) { create :meeting, starts_at: '2015-11-11 14:03' }

      it 'should return only one meeting' do
        expect(Api::Rest::Meeting.filtered_by(hour_to: 13)).to eq([meeting1])
      end
    end

    context 'weekday' do
      let(:meeting1) { create :meeting, starts_at: '2016-01-18 12:03' }
      let(:meeting2) { create :meeting, starts_at: '2016-01-19 14:03' }

      it 'should return only one meeting' do
        expect(Api::Rest::Meeting.filtered_by(weekday: 1)).to eq([meeting1])
      end
    end

    context 'distance' do
      let(:meeting1) { create :meeting, lat: 55.03923, lng: 82.927818 }
      let(:meeting2) { create :meeting, lat: 55.042827, lng: 82.936649 }

      it 'should return ordered list' do
        expect(Api::Rest::Meeting.filtered_by({ distance: 1, lat: 55.029498, lng: 82.916822})).to eq([meeting1])
      end
    end
  end
end
