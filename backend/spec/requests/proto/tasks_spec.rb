require 'rails_helper'

RSpec.describe "Proto::Tasks", type: :request do
  describe "GET /proto/tasks" do
    it "works! (now write some real specs)" do
      get proto_tasks_index_path
      expect(response).to have_http_status(200)
    end
  end
end
