require 'rails_helper'

RSpec.describe "Proto::Tasks", type: :request do
  describe "GET /proto/tasks" do
    it "特に条件を指定しなくても、200を返すこと" do
      get proto_tasks_path
      expect(response).to have_http_status(200)
    end

    context "taskが1件も存在しないとき" do
      it "空の encoded_data が返却されること" do

      end
    end

    context "taskが1件存在するとき" do

      it "task1件分の encoded_data が返却されること" do

      end
    end

    context "taskが2件存在するとき" do
      it "task2件分の encoded_data が返却されること" do

      end
    end
  end
end
