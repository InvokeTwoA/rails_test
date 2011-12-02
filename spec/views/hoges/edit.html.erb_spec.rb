require 'spec_helper'

describe "hoges/edit.html.erb" do
  before(:each) do
    @hoge = assign(:hoge, stub_model(Hoge))
  end

  it "renders the edit hoge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hoges_path(@hoge), :method => "post" do
    end
  end
end
