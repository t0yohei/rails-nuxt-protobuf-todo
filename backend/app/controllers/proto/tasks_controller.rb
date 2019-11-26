
class Proto::TasksController < ApplicationController
  def index
    tasks = Task.all
    tasks_proto = Protos::Tasks.new
    tasks.each do |each_task|
      task_proto = Protos::Task.new(
        id: each_task.id,
        title: each_task.title,
        description: each_task.description
      )
      tasks_proto.task.push(task_proto)
    end

    response = Protos::FetchTasksResponse.new(tasks: tasks_proto)
    response_encoded_data = Protos::FetchTasksResponse.encode(response)
    render plain: response_encoded_data, status: :ok
  end

  def show
    task = Task.find(params[:id])
    task_proto = Protos::Task.new(
      id: task.id,
      title: task.title,
      description: task.description
    )
    response = Protos::FetchTaskResponse.new(task: task_proto)
    response_encoded_data = Protos::FetchTaskResponse.encode(response)
    render plain: response_encoded_data, status: :ok
  end

  def create
    decoded_data = Protos::CreateTaskRequest.decode(request.raw_post)
    task = Task.new(title: decoded_data.title, description: decoded_data.description)
    if task.save
      status = Protos::Status.new(code: 201, message: "#{task.title}を作成しました。")
      render plain: build_create_message_encoded(status: status), status: :created
    else
      status = Protos::Status.new(code: 400, message: "#{task.title}の作成に失敗しました。")
      render plain: build_create_message_encoded(status: status), status: :bad_request
    end
  end

  def update
    task = Task.find(params[:id])
    decoded_data = Protos::UpdateTaskRequest.decode(request.raw_post)
    if task.update(title: decoded_data.title, description: decoded_data.description)
      status = Protos::Status.new(code: 200, message: "#{task.title}を更新しました。")
      render plain: build_update_message_encoded(status: status), status: :ok
    else
      status = Protos::Status.new(code: 400, message: "#{task.title}の更新に失敗しました。")
      render plain: build_update_message_encoded(status: status), status: :bad_request
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render status: :no_content
  end

  private

  def build_create_message_encoded(status:)
    message = Protos::CreateTaskResponse.new(status: status)
    Protos::CreateTaskResponse.encode(message)
  end

  def build_update_message_encoded(status:)
    message = Protos::UpdateTaskResponse.new(status: status)
    Protos::UpdateTaskResponse.encode(message)
  end
end
