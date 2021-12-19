# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#

# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + '/environment')
# cronを実行する環境変数
# rails_env = ENV['RAILS_ENV'] || :development
# env :PATH, ENV['PATH']
rails_env = :development
# cronを実行する環境変数をセット
set :environment, rails_env
# set :environment, :development

# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 1.days, at: '10:00 am' do
#   # rails runner "ItemsHelper::Items.check"
#   # runner "NotificationMailer.send_first_notice(item)"
#   # runner "NotificationMailer.send_last_notice(item)"
# end

every 1.days, at: '10:00 am' do
  runner "Batch::Task.item_check"
  # bundle exec rails runner Batch::Task.item_check
end

# Learn more: http://github.com/javan/whenever
