require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品の購入' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '商品の購入ができるとき' do
      it 'すべての値が正しく入力されていれば商品の購入ができること' do
        expect(@purchase_address).to be_valid
      end

      it 'building_nameは空でも商品の購入ができること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '表品の購入ができないとき' do
      it 'post_numberが空では商品の購入ができないこと' do
        @purchase_address.post_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'post_numberが半角のハイフンを含んだ正しい形式でないと商品の購入ができないこと' do
        @purchase_address.post_number = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号にはハイフン(-)を含めてください')
      end

      it 'prefecture_idが1では商品の購入ができないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を選択してください")
      end

      it 'cityが空では商品の購入ができないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'house_numberが空では商品の購入ができないこと' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numberが空では商品の購入ができないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
      end

      it 'phone_numberは12桁以上の数値では商品の購入ができないこと' do
        @purchase_address.phone_number = '090111122223'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は11文字以内で入力してください')
      end

      it 'phone_numberは数値以外が含まれていると商品の購入ができないこと' do
        @purchase_address.phone_number = '03-111-2222'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は半角数字で入力してください（ハイフン(-)不要）')
      end

      it 'phone_numberは英数混合では商品の購入ができないこと' do
        @purchase_address.phone_number = '080abcd1234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は半角数字で入力してください（ハイフン(-)不要）')
      end

      it 'user_idが空では商品の購入ができないこと' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
      end

      it 'item_idが空では商品の購入ができないこと' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
      end

      it 'tokenが空では商品の購入ができないこと' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end
