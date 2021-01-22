require 'rails_helper'

RSpec.describe User, type: :model do
  context "accountを指定している時" do
    it "ユーザーが作られる" do
      user = User.new(name: "pon",account: "pon",email: "pon@example.com")
      # expect(user.valid?).to eq true
      expect(user).to be_valid 
    end
  end
  # binding.pry
  context "accountを指定していない時" do
    it "ユーザー作成に失敗する" do
      user = User.new(name: "pon",email: "pon@example.com")
      expect(user).to be_invalid 
      expect(user.errors.details[:account][0][:error]).to eq :blank
    end
  end

  # context "まだ同じ名前のaccountが存在しない時"do
  #   it "ユーザーが作られる" do
  #     user = User.new(name: "pon",email: "pon@example.com")
  #     expect(user).to be_invalid 
  #   end
  # end


  context "すでに同じ名前のaccountが存在している時" do
    it "ユーザー作成に失敗する" do
    User.create!(name: "pon",account: "pon",email: "pon@example.com")
    user = User.new(name: "pochi",account: "pon",email: "pochi@example.com")
    expect(user).to be_invalid
    expect(user.errors.details[:account][0][:error]).to eq :taken
    
    end
  end

end


