require 'rails_helper'

RSpec.describe "Proto::Tasks", type: :request do
  describe "GET /proto/tasks" do
    it "特に条件を指定しなくても、200を返すこと" do
      get proto_tasks_path
      expect(response).to have_http_status(200)
    end

    context "taskが1件も存在しないとき" do
      it "空の encoded_data が返却されること" do
        get proto_tasks_path
        expect(response).to have_http_status(200)
        decoded_response = Protos::FetchTasksResponse.decode(response.body)
        expect(decoded_response.tasks.task).to be_empty
      end
    end

    context "taskが1件存在するとき" do
      let!(:task) { Task.create(id: 1, title: 'title', description: 'description') }
      it "task1件分の encoded_data が返却されること" do
        get proto_tasks_path
        decoded_response = Protos::FetchTasksResponse.decode(response.body)
        expect(decoded_response.tasks.task.count).to eq(1)
        expect(decoded_response.tasks.task.first.id).to eq(task.id)
        expect(decoded_response.tasks.task.first.title).to eq(task.title)
        expect(decoded_response.tasks.task.first.description).to eq(task.description)
      end
    end

    context "taskが2件存在するとき" do
      let!(:task1) { Task.create(id: 1, title: 'title1', description: 'description1') }
      let!(:task2) { Task.create(id: 2, title: 'title2', description: 'description2') }
      it "task2件分の encoded_data が返却されること" do
        get proto_tasks_path
        decoded_response = Protos::FetchTasksResponse.decode(response.body)
        expect(decoded_response.tasks.task.count).to eq(2)
        expect(decoded_response.tasks.task.first.id).to eq(task1.id)
        expect(decoded_response.tasks.task.first.title).to eq(task1.title)
        expect(decoded_response.tasks.task.first.description).to eq(task1.description)
      end
    end
  end

  describe "GET /proto/task/:id" do
    context "存在しないtaskのidを指定したとき" do
      it "404エラーのレスポンスが返却されること" do
      end
    end

    context "taskが1件存在するとき" do
      let!(:task) { Task.create(id: 1, title: 'title', description: 'description') }
      it "task1件分の encoded_data が返却されること" do
        get proto_task_path(id: 1)
        decoded_response = Protos::FetchTaskResponse.decode(response.body)
        expect(decoded_response.task.id).to eq(task.id)
        expect(decoded_response.task.title).to eq(task.title)
        expect(decoded_response.task.description).to eq(task.description)
      end
    end
  end
end
