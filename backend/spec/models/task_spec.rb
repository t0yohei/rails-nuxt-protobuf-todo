require 'rails_helper'

RSpec.describe Task, type: :model do
  context "validationのテスト" do
    context 'title' do
      subject { Task.new(title: title) }

      describe "title が0文字のとき" do
        let(:title) { '' }
        it { is_expected.to be_invalid }
      end

      describe "title が1文字のとき" do
        let(:title) { '1' }
        it { is_expected.to be_valid }
      end

      describe "title が25文字のとき" do
        let(:title) { build_random_string(25) }
        it { is_expected.to be_valid }
      end

      describe "title が26文字のとき" do
        let(:title) { build_random_string(26) }
        it { is_expected.to be_invalid }
      end
    end

    context 'description' do
      subject { Task.new(title: 'title', description: description) }

      describe "description が0文字のとき" do
        let(:description) { '' }
        it { is_expected.to be_valid }
      end

      describe "description が100文字のとき" do
        let(:description) { build_random_string(100) }
        it { is_expected.to be_valid }
      end

      describe "description が101文字のとき" do
        let(:description) { build_random_string(101) }
        it { is_expected.to be_invalid }
      end
    end
  end

  def build_random_string(length)
    (1..length).inject('') { |result| result << rand(1..9).to_s }
  end
end
