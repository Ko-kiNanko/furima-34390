require 'rails_helper'

RSpec.describe PurchaseDetail, type: :model do
  before do
    # @user = FactoryBot.build(:user)
    # @item = FactoryBot.build(:item)
    @purchasedetail = FactoryBot.build(:purchase_detail, item_id: 2, user_id: 3)
  end
    describe "商品購入機能" do
      context '商品登録がうまくいく時' do
        it "必要な情報を適切に入力すると、商品の購入ができる" do
          expect(@purchasedetail).to be_valid
        end
        it "電話番号が11桁だと登録できる" do
          @purchasedetail.phone_number = "09012345678"
          expect(@purchasedetail).to be_valid
        end
      end

      context '商品登録がうまくいかない時' do
      it "郵便番号が空だと登録できない" do
        @purchasedetail.post_number = ""
        @purchasedetail.valid?
        expect(@purchasedetail.errors.full_messages).to include("Post number can't be blank")
      end
      it "郵便番号にーがないと登録できない" do
        @purchasedetail.post_number = "1234567"
        @purchasedetail.valid?
        expect(@purchasedetail.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it "都道府県が空だと登録できない" do
        @purchasedetail.prefecture_id = ""
        @purchasedetail.valid?
        expect(@purchasedetail.errors.full_messages).to include("Prefecture is not a number")
      end
      it "prefecture.idが1だと登録できない" do
        @purchasedetail.prefecture_id = "1"
        @purchasedetail.valid?
        expect(@purchasedetail.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市区町村が空だと登録できない" do
        @purchasedetail.municipality = ""
        @purchasedetail.valid?
        expect(@purchasedetail.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が空だと登録できない" do
        @purchasedetail.address = ""
        @purchasedetail.valid?
        expect(@purchasedetail.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空だと登録できない" do
        @purchasedetail.phone_number = ""
        @purchasedetail.valid?
        expect(@purchasedetail.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が11桁以外だと登録できない" do
        @purchasedetail.phone_number = "123456789012"
        @purchasedetail.valid?
        expect(@purchasedetail.errors.full_messages).to include("Phone number is invalid")
      end
      it "クレジットカードの情報が空だと登録できない" do
        @purchasedetail.token = nil
        @purchasedetail.valid?
        binding.pry
        expect(@purchasedetail.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end


# - ログイン状態の出品者であっても、URLを直接入力して自身の売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移すること（商品情報編集機能）
