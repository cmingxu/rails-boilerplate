require 'spec_helper'

describe "counters/edit" do
  before(:each) do
    @counter = assign(:counter, stub_model(Counter,
      :times => 1
    ))
  end

  it "renders the edit counter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", counter_path(@counter), "post" do
      assert_select "input#counter_times[name=?]", "counter[times]"
    end
  end
end
