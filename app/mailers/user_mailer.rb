# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_mail(user)
    @user = user
    @url = 'rafflies.herokuapp.com'
    mail(to: @user.mail, subject: 'Welcome to Rafflies!')
  end

  def request_approved(request)
    @user = request.user
    @amount = request.amount
    mail(to: @user.mail, subject: 'Request approved')
  end

  def winner(raffle, number, user, prize)
    @raffle = raffle
    @number = number
    @user = user
    @prize = prize
    mail(to: @user.mail, subject: 'You are a winner!')
  end
end
