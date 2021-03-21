require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'images, title, description, category_id, condition_id, deliverry_fee_id,
          prefecture_id, send_within_id, priceが存在すれば商品出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageが空では商品出品できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('出品画像を添付してください')
      end

      it 'titleが空では商品出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end

      it 'descriptionが空では商品出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end

      it 'category_idは1以外を選択されていなければ商品出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end

      it 'condition_idは1以外を選択されていなければ商品出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end

      it 'delivery_fee_idが空では商品出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end

      it 'prefecture_idは1以外を選択されていなければ商品出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end

      it 'send_within_idは1以外を選択されていなければ商品出品できない' do
        @item.send_within_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end

      it 'priceが空では商品出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end

      it 'priceが¥9,999,999より大きければ商品出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end

      it 'priceが¥300より小さければ商品出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end

      it 'priceが半角英字では商品出品できない' do
        @item.price = 'abcde'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it 'priceが半角英数混合では商品出品できない' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it 'priceが全角文字では商品出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it 'userが紐づいていないと商品出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
