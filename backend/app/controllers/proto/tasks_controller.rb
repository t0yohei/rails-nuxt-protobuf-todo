
class Proto::TasksController < ApplicationController
  def index
    tasks = Task.all
    tasks_proto = Protos::Tasks.new
    tasks.each do |each_task|
      task_proto = Protos::Task.new(id: each_task.id, title: each_task.title)
      tasks_proto.task.push(task_proto)
    end

    response = Protos::FetchTasksResponse.new(tasks: tasks_proto)
    response_encoded_data = Protos::FetchTasksResponse.encode(response)
    render plain: response_encoded_data, status: :ok
  end

  # def show
  #   task = Task.find(params[:id])
  #   render json: task, status: :ok
  # end

  def create
    decoded_data = Protos::CreateTaskRequest.decode(request.raw_post)
    task = Task.new(title: decoded_data.title)
    if task.save
      status = Protos::Status.new(code: 201, message: "#{task.title}を作成しました。")
      render plain: build_create_message_encoded(status: status), status: :created
    else
      status = Protos::Status.new(code: 400, message: "#{task.title}の作成に失敗しました。")
      render plain: build_create_message_encoded(status: status), status: :bad_request
    end
  end

  # def update
  #   task = Task.find(params[:id])
  #   task.update(task_params)
  #   render json: task, status: :ok
  # end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render status: :no_content
  end

  private

  # def task_params
  #   params.require(:task).permit(:title)
  # end

  def build_create_message_encoded(status:)
    message = Protos::CreateTaskResponse.new(status: status)
    Protos::CreateTaskResponse.encode(message)
  end
end
