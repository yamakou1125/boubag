class Batch::Task
  def self.item_check
    @today = Date.today
    @items = Item.where(expiration_date: Date.today)
    @items.each do |item|
      NotificationMailer.send_last_notice(item).deliver
    end
    @items = Item.where(expiration_date: Date.today+14)
    @items.each do |item|
      NotificationMailer.send_first_notice(item).deliver
    end
  end
end