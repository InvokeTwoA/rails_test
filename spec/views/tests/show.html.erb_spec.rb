require 'spec_helper'

describe "tests/show.html.erb" do
  before(:each) do
    @test = assign(:test, stub_model(Test,
      :title => "MyText",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
