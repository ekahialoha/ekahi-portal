class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    if resource.save
      render_success_response(resource, :created)
    else
      render_exception_response(resource, :bad_request)
    end
  end
end
