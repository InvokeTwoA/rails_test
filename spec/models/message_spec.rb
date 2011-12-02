require 'spec_helper'

describe Message do
  # method姪とかを書くだけ
  describe 'validation' do
    before do
      @message = Message.new(:name => 'test名前', :comment=> 'test本文' )
      @message.save
    end
    context "正常なデータを入れた場合" do
      it "保存される事" do
        @message.should_not be_new_record
      end
    end
    context "名前が空のデータを入れた場合" do
      it "保存されない事" do
        @message.should_not be_new_record
      end
    end
  end
end
