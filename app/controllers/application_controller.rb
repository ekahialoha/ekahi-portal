class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_json(response)
    if response.errors.empty?
      render json: response
    else
      # model_validation_error(response)
      render_exception_response(response, :bad_request, 400)
    end
  end

  def authenticate_user!(options = {})
    render json: {unauthorized: :true} unless signed_in?
  end

  def render_success_response(status, response, code=200)
    render json: {
      success: :true,
      status: status,
      code: code,
      data: response
    }, status: status
  end

  def render_exception_response(exception, status=:unprocessable_entity, code=400)
    render json: {
      error: :true,
      code: code,
      errors: exception.fetch(:errors, status)
    }, status: status
  end

  def render_not_found_response()
    render_exception_response({}, :not_found, 404)
  end
end
