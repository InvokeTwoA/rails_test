require 'spec_helper'

describe "tests/new.html.erb" do
  before(:each) do
    assign(:test, stub_model(Test,
      :title => "MyText",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new test form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tests_path, :method => "post" do
      assert_select "textarea#test_title", :name => "test[title]"
      assert_select "textarea#test_body", :name => "test[body]"
    end
  end
end
