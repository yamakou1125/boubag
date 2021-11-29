class NotificationMailer < ApplicationMailer

  def send_first_notice(item)
    @item = item
    @user = item.user
    mail to: @user.email, subject: '【boubag】 登録いただいた非常食の賞味期限が切れそうです。'
  end

  def send_last_notice(item)
    @item = item
    @user = item.user
    mail to: @user.email, subject: '【boubag】 登録いただいた非常食の賞味期限が切れました。'
  end
end
