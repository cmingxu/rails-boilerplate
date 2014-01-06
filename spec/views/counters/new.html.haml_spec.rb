require 'spec_helper'

describe "counters/new" do
  before(:each) do
    assign(:counter, stub_model(Counter,
      :times => 1
    ).as_new_record)
  end

  it "renders new counter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", counters_path, "post" do
      assert_select "input#counter_times[name=?]", "counter[times]"
    end
  end
end
