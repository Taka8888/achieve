class NotificationsController < ApplicationController
  before_action :authenticate_user!


def index
   #@notifications = Notification.where(user_id: current_user.id).where(read: false).order(created_at: :desc)
   @notifications =Notification.collect_unread(current_user.id).with_comment.check_user(current_user.id).order(created_at: :desc)
    end
end
