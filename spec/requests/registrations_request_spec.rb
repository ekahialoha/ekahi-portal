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

  describe 'registrations#create' do
    context 'when params is valid' do
        before do

        end

        it 'response status code is 201' do

        end

        it 'response contains success' do

        end

        it 'response header contains authorization token' do

        end

        it 'response header authorization token is valid  ' do

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

      it "response contains error" do
        expect(@body['error']).to eq 'true'
      end

      it "response contains errors" do
        expect(@body['errors']).to be_present
      end
    end
  end
end
