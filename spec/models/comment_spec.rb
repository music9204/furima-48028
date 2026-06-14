require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿機能' do
    context 'コメント投稿ができる場合' do
      it 'テキストが存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿ができない場合' do
      it 'テキストが空では投稿できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end

      it 'ユーザーが紐付いていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end

      it '商品が紐付いていないと投稿できない' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Item must exist')
      end
    end
  end
end
