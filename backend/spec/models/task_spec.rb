require 'rails_helper'

RSpec.describe Task, type: :model do
  context "validationのテスト" do
    context 'title' do
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

    context 'description' do
      let(:title) { 'title' }
      it "description が0文字だと有効なこと" do
        task = Task.new(title: title, description: '')
        expect(task).to be_valid
      end

      it "description が100文字だと有効なこと" do
        description100 = (1..100).inject('') { |result| result << rand(1..9).to_s }
        task = Task.new(title: title, description: description100)
        expect(task).to be_valid
      end

      it "description が101文字だと無効なこと" do
        description101 = (1..101).inject('') { |result| result << rand(1..9).to_s }
        task = Task.new(title: title, description: description101)
        expect(task).to be_invalid
      end
    end
  end
end
