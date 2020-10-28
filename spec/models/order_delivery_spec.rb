require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '商品購入機能' do

    before do
      @item = FactoryBot.build(:order_delivery)
    end

    it "全ての値が正しく入力されていれば保存できること" do
      expect(@item).to be_valid
    end

    it "カード情報が正しく入力されていないと登録できないこと" do
      @item.token = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号が正しく入力されていないと登録できないこと" do
      @item.postal_code = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postal code can't be blank", "Postal code can't be blank. Input half-width numbers with hyphen(-)")
    end

    it "配送先の都道府県が選択されていないと登録できないこと" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture  must be choiced")
    end

    it "市区町村が入力されていないと登録できないこと" do
      @item.city = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("City can't be blank")
    end

    it "番地が入力されていないと登録できないこと" do
      @item.house_number = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("House number can't be blank")
    end

    it "電話番号が正しく入力されていないと登録できないこと" do
      @item.phone_number = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Input half-width numbers without hyphen(-)")
    end


  end
end