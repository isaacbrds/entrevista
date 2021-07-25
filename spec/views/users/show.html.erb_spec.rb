require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, create(:user, full_name: "Name"))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end