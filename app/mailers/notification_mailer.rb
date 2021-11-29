class NotificationMailer < ApplicationMailer

  def send_first_notice(item)
    @item = item
    @user = item.user
    mail to: @user.email, subject: '【boubag】 防災アイテム交換のお知らせ'
  end

  def send_last_notice(item)
    @item = item
    @user = item.user
    mail to: @user.email, subject: '【boubag】 防災アイテム交換のお知らせ'
  end
end
