require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    @user = assign(:user, create(:user, full_name: "Name"))
  end

  it "renders a new users form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[full_name]"
    end
  end

end