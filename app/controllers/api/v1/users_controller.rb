# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show like pass]

      def show
        render json: @user
      end

      def like
        current_user.like(@user)
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
        @user = (User.all - current_user.favoriting - current_user.passing).sample
      end
    end
  end
end
