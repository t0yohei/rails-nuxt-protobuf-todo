
class Proto::TasksController < ApplicationController
  def index
    tasks = Task.all
    task_proto = ::Protos::Task.new(id: tasks.first.id, title: tasks.first.title)
    task_proto_json = Protos::Task.encode_json(task_proto)
    render json: task_proto_json, status: :ok
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
