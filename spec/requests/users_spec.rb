require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    subject{ get(users_path)}
    before {create_list(:user,3)}
    it "ユーザーの一覧が取得できる" do
  #  get users_path
      subject
    res = JSON.parse(response.body)
    expect(res.length).to eq 3
    expect(res[0].keys).to eq ["id", "account", "name", "email", "created_at", "updated_at"]
    expect(response).to have_http_status(200)
    expect(response.status).to eq 200
    end
  end

  describe  "GET/users/:id" do
    subject { get(user_path(user_id))}
  
    context "指定したidのユーザーが存在するとき" do
    let(:user_id){ user.id}
    let(:user) { create(:user) }

    fit "そのユーザーのレコードが取得できる" do
      subject
      binding.pry
      expect(response).to have_http_status(200)
   end
   end
    
    context "指定したidのユーザーが存在しない時" do
      it "ユーザーが見つからない" do
      end
    end
  end

  describe  "POST/users" do
    it "ユーザーのレコードを作成できる" do
    end
  end

  describe  "PATCH/users/:id" do
    it "任意のユーザーのレコードを更新できる" do
    end
  end

  describe "DELETE/users/:id" do
    it "任意のユーザーのレコードを削除できる" do
    end
  end

end
