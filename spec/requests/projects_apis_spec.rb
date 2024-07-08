require 'rails_helper'

RSpec.describe "ProjectsApis", type: :request do
  describe "GET /projects_apis" do
    it "loads a project" do 
      user = FactoryBot.create(:user)
      FactoryBot.create(:project, name: "Sample Project")
      FactoryBot.create(:project, name: "Second Sample Project", owner: user)
      
      # index page
      get api_projects_path, params: {
        user_email: user.email,
        user_token: user.authentication_token
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)

      expect(json.length).to eq 1
      project_id = json[0]["id"]

      # show page
      get api_project_path(project_id), params: {
        user_email: user.email,
        user_token: user.authentication_token
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json["name"]).to eq "Second Sample Project"
    end 

    # it "creates a project" do 
    #   user = FactoryBot.
    # end 
  end
end
