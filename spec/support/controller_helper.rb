module ControllerHelpers
  def login(user)
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in(user)
  end

  def json
    @json ||= JSON.parse(response.body)
  end
end
