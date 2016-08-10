require 'rails_helper'

RSpec.describe Api::Rest::Filter, type: :model do
  describe "validations" do
    context "when attributes is not present" do

      let(:filter) { build :filter, value: "" }

      before do
        @result = filter.valid?
      end

      it "should be invalid and have errors" do
        expect(@result).to eq(false)
        expect(filter.errors.messages).to eq({ :value => ["can't be blank"],
                                               :user => ["can't be blank"]
                                              })
      end
    end

  end
end
