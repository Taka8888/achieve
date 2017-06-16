require 'rails_helper'

describe Contact do
  # 名前、メールと内容があれば有効な状態であること
  it "is valid with title" do
    contact = Contact.new(name: '木下', email: 'kinoshita@yahoo.co.jp',  content: '問い合わせだよ' )
    expect(contact).to be_valid
  end

  #タイトルがなければ無効であること
  it "is invalid name and email length more than 50 words" do
    contact = Contact.new(name: 'あああああああああああああああああああああああああああああああああああああああああああああああああああ５２', email: '５１aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@y.co' )
    expect(contact).not_to be_valid
  end
    #名前、メールと内容がなければ無効であること
    it "is valid with name,emai,content" do
      contact = Contact.new
      contact.valid?
      expect(contact.errors[:name]).to include("を入力してください")
      expect(contact.errors[:email]).to include("を入力してください")
      expect(contact.errors[:content]).to include("を入力してください")
   end

   it "is valid with emai" do
     contact =Contact.new(email: 'yyyy')
     expect(contact).not_to be_valid
   end
end
