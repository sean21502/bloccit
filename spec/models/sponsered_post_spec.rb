require 'rails_helper'

RSpec.describe SponseredPost, type: :model do
 
context "attributes" do
	  	let(:sponseredPost) {SponseredPost.new(title: "New Sponser Title", body: "New Sponser Body", price: 99) }

    it "should respond to title" do
      expect(sponseredPost).to respond_to(:title)
    end

    it "should respond to body" do
      expect(sponseredPost).to respond_to(:body)
    end

    it "should respond to price" do
      expect(sponseredPost).to respond_to(:price)
    end
  end
end