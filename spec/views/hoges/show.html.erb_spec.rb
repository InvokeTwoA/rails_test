require 'spec_helper'

describe "hoges/show.html.erb" do
  before(:each) do
    @hoge = assign(:hoge, stub_model(Hoge))
  end

  it "renders attributes in <p>" do
    render
  end
end
