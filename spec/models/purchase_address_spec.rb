require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, item_id: item.id )
      sleep(0.1)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end

    it 'post_numberが空では保存できないこと' do
      @purchase_address.post_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post number can't be blank")
    end
    
    it 'post_numberが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.post_number = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
    end
    
    it 'prefecture_idが1では保存ができないこと' do
      @purchase_address.prefecture_id = '1'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it 'cityが空では保存ができないこと' do
      @purchase_address.city = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    
    it 'house_numberが空では保存ができないこと' do
      @purchase_address.house_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end
    
    it 'building_nameは空でも保存ができること' do
      @purchase_address.building_name = ''
      expect(@purchase_address).to be_valid
    end
    
    it 'phone_numberが空では保存ができないこと' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    
    it 'phone_numberは12桁以上の数値では保存ができないこと' do
      @purchase_address.phone_number = '090111122223'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end

    it 'phone_numberは数値以外が含まれていると保存ができないこと' do
      @purchase_address.phone_number = '03-111-2222'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
    
    it 'user_idが空では保存ができないこと' do
      @purchase_address.user_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では保存ができないこと' do
      @purchase_address.item_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
    
    it 'tokenが空では保存ができないこと' do
      @purchase_address.token = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
