class NotificationJob
  include Sidekiq::Job

  def perform(user_email, message)
    puts "--------------------------------------------------"
    puts "ENVIANDO NOTIFICAÇÃO PARA: #{user_email}"
    puts "MENSAGEM: #{message}"
    puts "--------------------------------------------------"
  end
end
