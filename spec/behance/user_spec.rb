require 'spec_helper'

describe Behance::Client::User do

  before(:all) do
    @client = Behance::Client.new(access_token: "abc123")
  end

  before do
    @options = { api_key: @client.access_token }
  end

  describe "#users" do
    context "without parameters" do
      before do
        stub_get("users").with(query: @options).
          to_return(body: fixture("users.json"))
        @users = @client.users
      end

      it "makes a http request" do
        a_get("users").
          with(query: @options).should have_been_made
      end

      it "gets an users list" do
        @users.size.should == 4
      end
    end

    context "with parameters" do
      before do
        @options.merge!(q: "Juan", state: "CA")
        stub_get("users").with(query: @options).
          to_return(body: fixture("users.json"))
      end

      it "gets an users list" do
        @users = @client.users(@options).size.should == 4
      end
    end
  end

  describe "#user" do
    before do
      stub_get("users/1").with(query: @options).
        to_return(body: fixture("user.json"))
      @user = @client.user(1)
    end

    it "makes a http request" do
      a_get("users/1").
        with(query: @options).should have_been_made
    end

    it "gets a single user" do
      @user["id"].should == 50001
    end
  end

  describe "#user_projects" do
    context "without parameters" do
      before do
        stub_get("users/1/projects").with(query: @options).
          to_return(body: fixture("user_projects.json"))
        @projects = @client.user_projects(1)
      end

      it "makes a http request" do
        a_get("users/1/projects").
          with(query: @options).should have_been_made
      end

      it "gets a list of projects" do
        @projects.size.should == 2
      end
    end

    context "with parameters" do
      before do
        @options.stub!(page: 1, time: Time.new)
        stub_get("users/1/projects").with(query: @options).
          to_return(body: fixture("user_projects.json"))
      end

      it "gets a list of projects" do
        @projects = @client.user_projects(1, @options).
          size.should == 2
      end
    end
  end

  describe "#user_wips" do
    context "without parameters" do
      before do
        stub_get("users/1/wips").with(query: @options).
          to_return(body: fixture("user_wips.json"))
        @wips = @client.user_wips(1)
      end

      it "makes a http request" do
        a_get("users/1/wips").
          with(query: @options).should have_been_made
      end

      it "gets a list of wips" do
        @wips.size.should == 2
      end
    end

    context "with parameters" do
      before do
        @options.merge!(sort: "appreciations", page: 2)
        stub_get("users/1/wips").with(query: @options).
          to_return(body: fixture("user_wips.json"))
      end

      it "gets a list of wips" do
        @wips = @client.user_wips(1, @options).size.
          should == 2
      end
    end
  end

  describe "#user_appreciations" do
    before do
      stub_get("users/1/appreciations").with(query: @options).
        to_return(body: fixture("user_appreciations.json"))
      @appreciations = @client.user_appreciations(1)
    end

    it "makes a http request" do
      a_get("users/1/appreciations").with(query: @options).
        should have_been_made
    end

    it "gets a list of appreciations" do
      @appreciations.size.should == 4
    end
  end

  describe "#user_collections" do
    before do
      stub_get("users/1/collections").with(query: @options).
          to_return(body: fixture("user_collections.json"))
      @collections = @client.user_collections(1)
    end

    it "makes a http request" do
      a_get("users/1/collections").with(query: @options).
          should have_been_made
    end

    it "gets a list of collections" do
      @collections.size.should == 2
    end
  end

  describe "#user_stats" do
    before do
      stub_get("users/1/stats").with(query: @options).
          to_return(body: fixture("user_stats.json"))
      @stats = @client.user_stats(1)
    end

    it "makes a http request" do
      a_get("users/1/stats").with(query: @options).
          should have_been_made
    end

    it "gets a users stats" do
      @stats.size.should == 2
      @stats["today"]["project_appreciations"].should == 5
      @stats["all_time"]["project_comments"].should == 20
    end
  end

  describe "#user_work_experience" do
    before do
      stub_get("users/1/work_experience").with(query: @options).
          to_return(body: fixture("user_work_experience.json"))
      @work_experience = @client.user_work_experience(1)
    end

    it "makes a http request" do
      a_get("users/1/work_experience").with(query: @options).
          should have_been_made
    end

    it "gets a list of work_experience" do
      @work_experience.size.should == 5
    end
  end
end
