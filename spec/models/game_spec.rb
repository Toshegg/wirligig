require 'rails_helper'

RSpec.describe Api::Rest::Game, type: :model do
  describe "validations" do
    context "when attributes is not present" do

      let(:game) { build :game, name: "" }

      before do
        @result = game.valid?
      end

      it "should be invalid and have errors" do
        expect(@result).to eq(false)
        expect(game.errors.messages).to eq({ :name => ["can't be blank"]
                                              })
      end
    end

  end

end
