require 'spec_helper'

describe MessagesController do
  fixtures :messages
  #fixtures はくそ  新しいやつ使う
  # before でデータ作る

  describe 'index' do
    context '一覧ページにアクセスした場合' do
      before do
        get :index
      end
      it 'HTTPレスポンスが 200系を返す' do
        response.should be_success
      end
      it 'index のテンプレートが読まれる' do
        response.should render_template('index')
      end
      it '@messages にメッセージ一覧のデータが格納される' do
        assigns[:messages].should == Message.all 
      end
      # FIXME 今だけ
      it 'データの総数を取得できる' do
        assigns[:messages].count.should == Message.count 
      end
    end
  end
  describe 'show' do
    context '存在するIDにアクセスした場合' do
      before do
        get  :show, :id => 3 
      end
      it "HTTPレスポンスが 200系を返す" do
        response.should be_success
      end
      it "show テンプレートがが読まれる" do
        response.should render_template("show")
      end
      it "@message にメッセージ詳細データが格納される" do
        assigns[:message].should == Message.find( 3 ) 
      end
    end
    context "存在しないIDにアクセスした場合" do
      before do
        get  :show, :id => 99 
      end
      it "not found のテンプレートが読まれる" do
        response.should render_template("notfound")
      end
    end
  end
  describe "create" do
    context "正常なデータを入れた場合" do
      before do
          post :create, :message => { :name => "テスト氏名", :comment =>"テストコメント" }
      end
      it "一覧ページにリダイレクトする" do
        response.should redirect_to( messages_path )
      end
      it "データが登録される" do
        expect {
          post :create, 
               :message => { :name => "テスト氏名", :comment =>"テストコメント" }
        }. should change(Message, :count).by(1)
      end
    end
    context "氏名が空のデータを入れた場合" do
      before do
          post :create, 
               :messages => { :name => '', :comment => 'テストコメント' }
      end
      it "new テンプレートが読まれる" do
        response.should render_template("new")
      end
      it "データは登録されない" do
        expect {
          post :create, 
               :messages => { :name => '', :comment => 'テストコメント' }
        }.should change(Message, :count).by(0)
      end
    end
    context "コメントが空のデータを入れた場合" do
      before do
        post :create, :messages => { :name => 'テスト氏名', :comment => '' }
      end
      it "new テンプレートが読まれる" do
        response.should render_template("new")
      end
      it "データは登録されない" do
        expect {
          post :create, :messages => { :name => 'テスト氏名', :comment => '' }
        }.should change(Message, :count).by(0)
      end
    end
  end
  describe "destroy" do
    context "正常なデータを削除した場合" do 
      it "一覧ページにリダイレクトする" do 
        expect { delete :destroy, :id => 3 }.should change(Message, :count).by(-1)
        response.should redirect_to( messages_path ) 
      end 
      it "データが削除される" do 
        #expect { delete :destroy, :id => 3 }.should change(Message, :count).by(-1)
        delete :destroy, :id => 3 
        Message.find_by_id(3).should be_nil 
      end
    end
    context "存在しないデータを削除しようとした場合" do
      before do
        delete :destroy, :id => 99
      end
      it "not found のテンプレートが読まれる" do
        response.should render_template("notfound")
      end
      it "データの更新はされない" do
        expect { delete :destroy, :id => 99 }.should change(Message, :count).by(0)
      end
    end
  end
end
