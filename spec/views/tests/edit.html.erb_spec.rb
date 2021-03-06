require 'spec_helper'

describe "tests/edit.html.erb" do
  before(:each) do
    @test = assign(:test, stub_model(Test,
      :title => "MyText",
      :body => "MyText"
    ))
  end

  it "renders the edit test form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tests_path(@test), :method => "post" do
      assert_select "textarea#test_title", :name => "test[title]"
      assert_select "textarea#test_body", :name => "test[body]"
    end
  end
end
