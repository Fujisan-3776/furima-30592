require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do

    before do
      @item = FactoryBot.build(:item)
    end

    it "image、item_name、item_describe、category_id、item_condition_id、delivery_charge_id、prefecture_id、shipping_days_id、priceが存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "image（出品画像）が存在しないと登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "item_name（商品名）が存在しないと登録できないこと" do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it "item_describe（商品の説明）が存在しないと登録できないこと" do
      @item.item_describe = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item describe can't be blank")
    end

    it "category_id（カテゴリー）が存在しないと登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be choiced")
    end

    it "category_id（カテゴリー）が0（デフォルトの状態）だと登録できないこと" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be choiced")
    end

    it "item_condition_id（商品の状態）が存在しないと登録できないこと" do
      @item.item_condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition must be choiced")
    end

    it "item_condition_id（商品の状態）が0（デフォルトの状態）だと登録できないこと" do
      @item.item_condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition must be choiced")
    end

    it "delivery_charge_id（配送料の負担）が存在しないと登録できないこと" do
      @item.delivery_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge must be choiced")
    end

    it "delivery_charge_id（配送料の負担）が0（デフォルトの状態）だと登録できないこと" do
      @item.delivery_charge_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge must be choiced")
    end

    it "prefecture_id（発送元の地域）が存在しないと登録できないこと" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be choiced")
    end

    it "prefecture_id（発送元の地域）が0（デフォルトの状態）だと登録できないこと" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be choiced")
    end

    it "shipping_days_id（発送までの日数）が存在しないと登録できないこと" do
      @item.shipping_days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days must be choiced")
    end

    it "shipping_days_id（発送までの日数）が0（デフォルトの状態）だと登録できないこと" do
      @item.shipping_days_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days must be choiced")
    end

    it "price（販売価格）が入力されていないと登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "price（販売価格）は300円未満では登録できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width numbers and must be over ¥300 and under ¥9,999,999 ")
    end

    it "price（販売価格）は10,000,000円以上では登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width numbers and must be over ¥300 and under ¥9,999,999 ")
    end

    it "price（販売価格）は全角数字では登録できないこと" do
      @item.price = "５０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width numbers and must be over ¥300 and under ¥9,999,999 ")
    end

  end
end