class UserMailer < ApplicationMailer
  default from: Rails.application.credentials.dig(:mailer, :email)
  
  def welcome_email(user)
    @user = user
    @url  = 'https://lemon.kehan.website'
    mail(to: @user.email, subject: '欢迎来到柠檬记账')
  end
end
  