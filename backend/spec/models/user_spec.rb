# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:someone) { create(:user) }

  describe '#like' do
    it 'should create new Action record' do
      expect { user.like(someone) }.to change { Action.all.size }.by 1
    end

    it 'should put someone to favoriting list' do
      user.like(someone)
      expect(user.favoriting).to include(someone)
    end
  end

  describe '#pass' do
    it 'should create new Action record' do
      expect { user.pass(someone) }.to change { Action.all.size }.by 1
    end

    it 'should put someone to passing list' do
      user.pass(someone)
      expect(user.passing).to include(someone)
    end
  end
end
