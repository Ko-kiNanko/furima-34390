require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    # sleep 0.5
  end
  describe "ユーザー新規登録" do

    context '新規登録がうまくいきとき' do
      it "nickname,email,last_name,first_name,last_name_kana,first_name_kana,birth_day,passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "last_name,first_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.last_name = "松モと"
        @user.first_name = "仁志"
        expect(@user).to be_valid
      end
      it "last_name_kana,first_name_kanaは全角（カタカナ）であれば登録できる" do
        @user.last_name_kana = "マツモト"
        @user.first_name_kana = "ヒトシ"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で半角英数字混合してあれば登録できる" do
        @user.password = "123456a"
        @user.password_confirmation = "123456a"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        # user = User.new(nickname: "", email: "kkk@gmail.com", password: "g0000000", password_confirmation: "g0000000", last_name: "山田", first_name: "太郎", last_name_kana: "ヤマダ", first_name_kana: "タロウ", birth_day: "2000/01/01")
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'おなじEmailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "emailに@が入っていない" do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは6文字以上ないと登録できない" do
      @user.password = "w1212"
      @user.password_confirmation = "w1212"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは、半角数字のみの場合は登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは、半角英字のみの場合は登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは、全角の場合は登録できない" do
        @user.password = "AAAAAA"
        @user.password_confirmation = "AAAAAA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordは、確認用を含めて2回入力しなければいけない" do
        @user.password = "123456a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationは一致が必須である" do
        @user.password = "123456a"
        @user.password_confirmation = "12345a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameは全角（漢字・ひらがな・カタカナ）での入力が必須" do
        @user.last_name = "hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）での入力が必須" do
        @user.first_name = "hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaは全角（カタカナ）での入力が必須" do
        @user.last_name_kana = "hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaは全角（漢字・ひらがな・カタカナ）での入力が必須" do
        @user.first_name_kana = "hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "birth_dayの入力が必須" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
