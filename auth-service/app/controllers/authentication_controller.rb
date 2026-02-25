class AuthenticationController < ApplicationController
  # Desabilita proteção CSRF para chamadas de API
  skip_before_action :verify_authenticity_token, raise: false

  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)

      render json: {
        token: token,
        exp: 24.hours.from_now.strftime("%Y-%m-%d %H:%M"),
        user: { email: user.email }
      }, status: :ok
    else
      render json: { error: 'E-mail ou senha inválidos' }, status: :unauthorized
    end
  end
end
