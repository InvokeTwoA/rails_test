require 'spec_helper'

describe "hoges/new.html.erb" do
  before(:each) do
    assign(:hoge, stub_model(Hoge).as_new_record)
  end

  it "renders new hoge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hoges_path, :method => "post" do
    end
  end
end
