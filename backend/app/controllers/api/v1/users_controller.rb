# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[like pass]

      def index
        users = User.all - current_user.favoriting - current_user.passing
        render json: users
      end

      def like
        current_user.like(@user)

        if current_user.favourites.include? @user
          notification(@user)
        end
        
        render json: { message: 'success' }
      end

      def pass
        current_user.pass(@user)
        render json: { message: 'success' }
      end

      def favoriting
        favoriting = current_user.favoriting
        render json: favoriting
      end

      def matching
        matching = current_user.favoriting & current_user.favourites
        render json: matching
      end

      private

      def set_user
        @user = User.find params[:id]
      end

      def notification(user)
        ActionCable.server.broadcast 'notification_channel', { message: "You match with #{user.first_name} #{user.last_name}"}
      end
    end
  end
end
