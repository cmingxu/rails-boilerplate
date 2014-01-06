require 'spec_helper'

describe "counters/index" do
  before(:each) do
    assign(:counters, [
      stub_model(Counter,
        :times => 1
      ),
      stub_model(Counter,
        :times => 1
      )
    ])
  end

  it "renders a list of counters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
