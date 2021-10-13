# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController

      before_action :set_user, only: [:show, :like, :pass]

      def show
        render json: @user
      end

      def like

      end

      def pass

      end

      def liked_list

      end

      def passed_list

      end

      def matched_list

      end

      private

      def set_user
        @user = (User.all - current_user.favoriting - current_user.passing).sample
      end

      def current_user
        p "hello"
        User.first
      end
    end
  end
end
