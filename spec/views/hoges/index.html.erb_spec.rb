require 'spec_helper'

describe "hoges/index.html.erb" do
  before(:each) do
    assign(:hoges, [
      stub_model(Hoge),
      stub_model(Hoge)
    ])
  end

  it "renders a list of hoges" do
    render
  end
end
