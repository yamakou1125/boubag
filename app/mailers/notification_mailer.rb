class NotificationMailer < ApplicationMailer

  def send_when_comming_soon_expiration_date(item) #メソッドに対して引数を設定
    @item = item
    @user = item.user
    mail to: @user.email, subject: '【boubag】 登録いただいた非常食の賞味期限が切れそうです。'
  end

  def send_when_expiration_date_is_today(item)
    @item = item
    @user = item.user
    mail to: @user.email, subject: '【boubag】 登録いただいた非常食の賞味期限が切れました。'
  end
end
