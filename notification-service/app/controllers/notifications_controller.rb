class NotificationsController < ApplicationController
  def create
    NotificationJob.perform_async(params[:email], params[:message])

    render json: { status: 'Notificação agendada com sucesso!' }, status: :ok
  end
end
