require 'spec_helper'

describe Behance::Client::User do

	before do
		@client = Behance::Client.new(access_token: "abc123")
	end

	it "search for users" do
		@client.users({}).should == true
	end

	it "gets basic information about an user" do
		@client.user(1).should == true
	end

	it "gets the projects published by an user" do
		@client.user_projects(1).should == true
	end
	
	it "gets the works-in-progress published by an user" do
		@client.user_wips(1).should == true
	end

	it "gets a list of user's recently appreciated projects" do
		@client.user_appreciated_projects(1) == true
	end

end
