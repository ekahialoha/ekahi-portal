class StaticContentsController < ApplicationController
  before_action :authenticate_user!, only: [:private, :check_admin, :check_elite]
  before_action -> { require_role_or_higher(:admin) }, only: [:check_admin]
  before_action -> { require_role_or_higher(:elite) }, only: [:check_elite]

  def public
      render_success_response({
          pulic: :true,
          user: current_user
        })
  end

  def check_admin
    render_success_response({ admin: true })
  end

  def check_elite
    render_success_response({ elite: true })
  end

  def private
      render_success_response({
          public: :false,
          user: current_user
        })
  end
end
