require 'rails_helper'

RSpec.describe Task, type: :model do
  context "validationのテスト" do
    it "title が0文字だと無効なこと" do
      task = Task.new(title: '')
      expect(task).to be_invalid
    end

    it "title が1文字だと有効なこと" do
      task = Task.new(title: '1')
      expect(task).to be_valid
    end

    it "title が25文字だと有効なこと" do
      task = Task.new(title: '1234567890123456789012345')
      expect(task).to be_valid
    end

    it "title が26文字だと無効なこと" do
      task = Task.new(title: '12345678901234567890123456')
      expect(task).to be_invalid
    end
  end
end
