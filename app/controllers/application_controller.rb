class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def authenticate_user!(options = {})
    render_exception_response({ unauthorized: :true }, :unauthorized, 401) unless signed_in?
  end

  def render_success_response(response, status = :ok, code = 200)
    render json: {
      success: true,
      status: status,
      code: code,
      data: response
    }, status: status
  end

  def render_exception_response(exception, status = :unprocessable_entity, code = 400)
    render json: {
      error: true,
      code: code,
      errors: exception.methods.include?(:errors) ? exception.errors : exception
    }, status: status
  end

  def render_not_found_response()
    render_exception_response({}, :not_found, 404)
  end
end
