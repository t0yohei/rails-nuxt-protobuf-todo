
class Proto::TasksController < ApplicationController
  def index
    tasks = Task.all
    tasks_proto = ::Protos::Tasks.new
    tasks.each do |each_task|
      task_proto = ::Protos::Task.new(id: each_task.id, title: each_task.title)
      tasks_proto.task.push(task_proto)
    end
    tasks_proto_encoded_data = Protos::Tasks.encode(tasks_proto)
    render plain: tasks_proto_encoded_data, status: :ok
  end

  # def show
  #   task = Task.find(params[:id])
  #   render json: task, status: :ok
  # end

  # def create
  #   task = Task.create(task_params)
  #   render json: task, status: :created
  # end

  # def update
  #   task = Task.find(params[:id])
  #   task.update(task_params)
  #   render json: task, status: :ok
  # end

  # def destroy
  #   task = Task.find(params[:id])
  #   task.destroy
  #   render json: task, status: :no_content
  # end

  private

  # def task_params
  #   params.require(:task).permit(:title)
  # end
end
