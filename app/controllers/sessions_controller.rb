class SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render_success_response(resource)
  end

  def respond_to_on_destroy
    render_success_response(:no_content)
  end
end
