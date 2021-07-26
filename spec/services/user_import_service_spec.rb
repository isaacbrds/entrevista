require "rails_helper"

describe UserImportService do
    context "when #call" do
        let!(:users) { create_list(:user, 15) }
    
        context "when params are present" do
        end
    
        context "when params are not present" do
        end
      end
end