# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_mail
    UserMailer.welcome_mail(User.first)
  end

  def request_approved
    UserMailer.request_approved(Request.first)
  end

  def winner
    UserMailer.winner(Raffle.first, Number.first, User.first, Prize.first)
  end
end
