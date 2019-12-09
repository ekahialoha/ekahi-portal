class AuthenticationFailure < Devise::FailureApp
  def respond
    self.status = 401
    self.content_type = "application/json"
    self.response_body = {
      error: true,
      code: 401,
      errors: i18n_message
   }.to_json
  end
end
