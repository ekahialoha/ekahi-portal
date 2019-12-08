class StaticContentsController < ApplicationController
  before_action :authenticate_user!, only: [:private]

  def public
      render_success_response({
          pulic: :true,
          user: current_user
        })
  end

  def private
      render_success_response({
          public: :false,
          user: current_user
        })
  end
end
