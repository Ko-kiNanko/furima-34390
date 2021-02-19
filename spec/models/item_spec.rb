require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
    describe "商品出品登録" do
    context '商品出品登録がうまくいきとき' do
      it "モデル情報が全て存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "priceは、半角数字かつ¥300~¥9,999,999の間のみ保存可能であること" do
        @item.price = "5000"
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it "imageが一枚ないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが必須であること" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "informationが必須であること" do
        @item.information = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it "category_idが1では登録できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "delivery_fee_idが1では登録できないこと" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "item_status_idが1では登録できないこと" do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 1")
      end
      it "prefecture_idが1では登録できないこと" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "shipping_day_idが1では登録できないこと" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
      it "priceが空では登録できないこと" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300以下では登録できないこと" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9,999,999以上では登録できないこと" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceは全角数字では登録できないこと" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end



# - 入力された販売価格によって、販売手数料や販売利益の表示が変わること
# - 必要な情報を適切に入力すると、商品情報がデータベースに保存されること