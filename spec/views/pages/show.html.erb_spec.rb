require 'spec_helper'

describe "pages/show.html.erb" do
  before(:each) do
    login(FactoryGirl.create(:student_sam))
    Page.any_instance.stub(:update_search_index)
    Page.any_instance.stub(:delete_from_search)
    assign(:page, FactoryGirl.create(:ppm))
  end

  it "renders attributes in <p>" do
    render
  end

  it "should show when the last edit occurred"

end
