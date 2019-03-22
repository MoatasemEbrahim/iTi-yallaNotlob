class HomeController < ApplicationController
    def home

        @orders = Order.where(user_id: current_user.id).order("id asc").last(5)

        @order = Order.where(
            user_id: Friendship.select("friend_id")
            .where(user_id: current_user.id)
        ).order("id asc").last(4)

        @users = User.all
    end
end
