class NotificationMailer < ApplicationMailer

  def send_first_notice(item)
    @item = item
    @user = item.user
    mail to: @user.email, subject: '【BouBag】 防災アイテム交換のお知らせ'
  end

  def send_last_notice(item)
    @item = item
    @user = item.user
    mail to: @user.email, subject: '【BouBag】 防災アイテム交換のお知らせ'
  end

  def send_contact_notice(contact)
    @contact = contact
    mail to:   ENV['GMAIL_ADDRESS'], subject: '【BouBag】ユーザ様からのお問い合わせ'
  end

end
