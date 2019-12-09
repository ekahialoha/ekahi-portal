require 'rails_helper'

RSpec.describe 'Registrations', type: :request do

  before(:each) do
    @post_url = '/users'
    @post_params = { user: {
        email: 'notActualEmail1@localhost',
        password: 'Password'
      }
    }
  end

  describe 'POST /users' do
    context 'when params is valid' do
        before do
          post @post_url, params: @post_params
          @body = JSON.parse(response.body)
        end

        it 'response status code is 201' do
          expect(response.status).to eq 201
        end

        it 'response contains success: true' do
          expect(@body['success']).to eq true
        end

        it 'response header contains authorization token' do
          expect(response.headers['Authorization']).to be_present
        end

        it 'response header authorization token is valid' do
          token = response.headers['Authorization'].split(' ').last
          token = JWT.decode(token, ENV['DEVISE_JWT_SECRET_KEY'], true)
          expect(token.first['jti']).to be_present
        end
    end

    context 'when params is missing or invalid' do
      before do
        post @post_url
        @body = JSON.parse(response.body)
      end

      it 'response status code is 400' do
        expect(response.status).to eq 400
      end

      it "response contains error: true" do
        expect(@body['error']).to eq true
      end

      it "response contains errors" do
        expect(@body['errors']).to be_present
      end
    end
  end
end
