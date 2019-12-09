require 'rails_helper'

RSpec.describe 'Authentication', type: :request do

  before(:each) do
    @user = FactoryBot.create(:user)
    @post_params = { user: {
        email: @user.email,
        password: @user.password
      }
    }
  end

  describe 'POST /users/sign_in' do

    context 'when params is valid' do
      before do

      end

      it "response status code 200" do

      end

      it "response contains success:true" do

      end

      it "response header contains authorization token" do

      end

      it "response header authorization token is valid" do

      end
    end

    context 'when params is missing or invalid' do
      before do

      end

      it "response status code is 401" do

      end

      it "response contains error: true" do

      end

      it "response contains errors" do

      end
    end
  end

  describe 'DELETE /users/sign_out' do
    it "response status code 200" do

    end

    it "response contains success: true" do

    end

    it "response header contains no authorization token" do

    end
  end
end
