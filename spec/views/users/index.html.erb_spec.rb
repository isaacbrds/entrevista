require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
     assign(:users, 
       create_list(:user, 4 , full_name: "Name")
       
      )
  end

  it "renders a list of users" do
    
    render
    assert_select "tr>td",text: "Name".to_s, count: 4
  end
end
