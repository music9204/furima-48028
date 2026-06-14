require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '全ての項目が正しく入力されれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明이空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報が「---」だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態の情報が「---」だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担の情報が「---」だと出品できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end

      it '発送元の地域の情報が「---」だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数の情報が「---」だと出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格に半角数字以外が含まれていると出品できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end

  describe '前後の商品への移動メソッド' do
    before do
      @user = FactoryBot.create(:user)
      @item1 = FactoryBot.create(:item, user: @user)
      @item2 = FactoryBot.create(:item, user: @user)
      @item3 = FactoryBot.create(:item, user: @user)
    end

    context 'メソッドが正常に動作する場合' do
      it 'previousメソッドは現在の商品よりIDが小さい直前の商品を返す' do
        expect(@item2.previous).to eq(@item1)
      end

      it 'nextメソッドは現在の商品よりIDが大きい直後の商品を返す' do
        expect(@item2.next).to eq(@item3)
      end

      it '最初の商品でpreviousメソッドを呼び出すとnilを返す' do
        expect(@item1.previous).to be_nil
      end

      it '最後の商品でnextメソッドを呼び出すとnilを返す' do
        expect(@item3.next).to be_nil
      end
    end
  end
end
