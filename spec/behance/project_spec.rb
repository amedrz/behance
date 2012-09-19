require 'spec_helper'

describe Behance::Client::Project do

  before(:all) do
    @client = Behance::Client.new(:access_token => "abc123")
  end

  describe ".projects" do
    before do
      stub_get("projects").with(query: { api_key: @client.access_token }).
        to_return(body: fixture("projects.json"))
      @projects = @client.projects
    end

    it "makes a http request" do
      a_get("projects").
        with(query: { api_key: @client.access_token }).should have_been_made
    end

    it "gets a list of projects" do
      @projects.size.should == 7
    end
  end

  describe ".project" do
    before do
      stub_get("project/4889175").with(query: { api_key: @client.access_token }).
        to_return(body: fixture("project.json"))
      @project = @client.project(4889175)
    end

    it "makes a http request" do
      a_get("project/4889175").
        with(query: { api_key: @client.access_token }).should have_been_made
    end

    it "gets a single project" do
      @project["id"].should == 4889175
    end
  end

  describe ".project_comments" do
    before do
      stub_get("project_comments/1").with(query: { api_key: @client.access_token }).
        to_return(body: fixture("project_comments.json"))
      @comments = @client.project_comments(1)
    end

    it "makes a http request" do
      a_get("project_comments/1").
        with(query: { api_key: @client.access_token }).should have_been_made
    end

    it "gets a list of comments" do
      @comments.size.should == 9
    end
  end

end
