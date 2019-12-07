class StaticContentsController < ApplicationController
  before_action :authenticate_user!, only: [:private]

  def public
    render json: {
        success: :true,
        public: :true
      }
  end

  def private
    render json: {
        success: :true,
        public: :false,
        user: current_user
      }
  end
end
