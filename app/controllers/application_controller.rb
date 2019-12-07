class ApplicationController < ActionController::API
  include ActionController::Cookies

  def render_json(response)
    if response.errors.empty?
      render json: response
    else
      model_validation_error(response)
    end
  end

  def model_validation_error(response)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: response.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  def authenticate_user!(options = {})
    render json: {unauthorized: :true} unless signed_in?
  end
end
