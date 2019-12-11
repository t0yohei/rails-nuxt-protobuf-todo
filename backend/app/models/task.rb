class Task < ApplicationRecord
  validates :title, presence: true, length: { in: 1..25 }
  validates :description, length: { maximum: 100 }

  def serialize
    Protos::Task.encode(self.convert_to_message_object)
  end

  def deserialize(data)
    task_message = Protos::Task.decode(data)
    Task.convert_from_message_object(task_message)
  end

  def self.serialize_all
    tasks_message = Protos::Tasks.new(
      tasks: Task.all.map {|task|
        task.convert_to_message_object
      }
    )
    Protos::Tasks.encode(tasks_message)
  end

  def self.deserialize_all(data)
    tasks_message = Protos::Tasks.decode(data)
    tasks_message.tasks.map {|task_message|
      Task.convert_from_message_object(task_message)
    }
  end

  def self.convert_from_message_object(task_message)
    Task.new.tap do |task|
      task.id = task_message.id
      task.title = task_message.title
      task.description = task_message.description
    end
  end

  def convert_to_message_object
    Protos::Task.new(
      :id => self.id,
      :title => self.title,
      :description => self.description
    )
  end
end
