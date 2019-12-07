class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

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

  def render_success_response(status, response)
    render json: {
      success: :true,
      status: status,
      data: response
    }
  end

  def render_unprocessable_entity_response(exception)
    render json: {
      error: :true,
      status: :unprocessable_entity,
      errors: exception.errors
    }
  end

  def render_not_found_response()
    render json: {
      error: true,
      status: :record_not_found,
    }
  end
end
