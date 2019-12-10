require 'rails_helper'

RSpec.describe "Proto::Tasks", type: :request do
  describe "GET /proto/tasks" do
    subject { get proto_tasks_path }
    it "特に条件を指定しなくても、200を返すこと" do
      subject
      expect(response).to have_http_status(200)
    end

    context "taskが1件も存在しないとき" do
      it "空の encoded_data が返却されること" do
        subject
        expect(response).to have_http_status(200)
        decoded_response = Protos::FetchTasksResponse.decode(response.body)
        expect(decoded_response.tasks.task).to be_empty
      end
    end

    context "taskが1件存在するとき" do
      let!(:task) { Task.create(id: 1, title: 'title', description: 'description') }
      it "task1件分の encoded_data が返却されること" do
        subject
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
        subject
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

  describe "POST /proto/tasks" do
    subject { post proto_tasks_path, params: params_encoded }
    let(:params_encoded) {
      Protos::CreateTaskRequest.encode(Protos::CreateTaskRequest.new(params))
    }

    context "正しい入力値が送られてきた時" do
      let(:params) {{ title: 'title', description: 'description' }}

      it "レコードの作成が完了すること" do
        expect{ subject }.to change{ Task.count }.by(1)
      end
      it "成功のレスポンスが帰ること" do
        subject
        decoded_response = Protos::CreateTaskResponse.decode(response.body)
        expect(decoded_response.status.code).to eq(201)
        expect(decoded_response.status.message).to eq("#{params[:title]}" + 'を作成しました。')
      end
    end

    context "不正な入力値が送られてきた時" do
      let(:params) {{ description: 'description' }}

      it "レコードの作成が失敗すること" do
        expect{ subject }.to change{ Task.count }.by(0)
      end
      it "失敗のレスポンスが帰ること" do
        subject
        decoded_response = Protos::CreateTaskResponse.decode(response.body)
        expect(decoded_response.status.code).to eq(400)
        expect(decoded_response.status.message).to eq('の作成に失敗しました。')
      end
    end
  end

  describe "PATCH /proto/tasks/:id" do
    subject { patch proto_task_path(id), params: params_encoded }

    context "存在する id が指定されたとき" do
      let!(:task) { Task.create(id: 1, title: 'title', description: 'description') }
      let(:id) { task.id }
      let(:params_encoded) {
        Protos::UpdateTaskRequest.encode(Protos::UpdateTaskRequest.new(params))
      }

      context "正しい入力値が送られてきた時" do
        let(:params) {{ title: 'title_changed', description: 'description_changed' }}

        it "成功のレスポンスが帰ること" do
          subject
          decoded_response = Protos::UpdateTaskResponse.decode(response.body)
          expect(decoded_response.status.code).to eq(200)
          expect(decoded_response.status.message).to eq("#{params[:title]}" + 'を更新しました。')
        end

        it "データが更新されていること" do
          subject
          task.reload
          expect(task.title).to eq(params[:title])
          expect(task.description).to eq(params[:description])
        end
      end

      context "不正な入力値が送られてきた時" do
        let(:params) {{ description: 'description_changed' }}

        it "失敗のレスポンスが帰ること" do
          post proto_tasks_url, params: params_encoded
          decoded_response = Protos::UpdateTaskResponse.decode(response.body)
          expect(decoded_response.status.code).to eq(400)
          expect(decoded_response.status.message).to eq('の作成に失敗しました。')
        end

        it "データが更新されていないこと" do
          subject
          task.reload
          expect(task.title).to eq('title')
          expect(task.description).not_to eq(params[:description])
        end
      end
    end

    context "存在しない id が指定されたとき" do
      it "レコードの更新が失敗すること" do
      end
    end
  end
end
