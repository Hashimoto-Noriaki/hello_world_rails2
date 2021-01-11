require 'rails_helper'

RSpec.describe User, type: :model do
  context "accountを指定している時" do
    it "ユーザーが作られる" do
      user = User.new(name: "pon",email: "pon",email:"pon@example.com")
    expect(user.valid?).to eq true
    end
  end
  binding.pry
  context "accountを指定していない時" do
    it "ユーザー作成に失敗する" do
    end
  end

  context "まだ同じ名前のaccountが存在しない時"　do
    it "ユーザーが作られる" do
    end
  end

  context "すでに同じ名前のaccountが存在している時" do
    it "ユーザー作成に失敗する" do
    end
  end
end


