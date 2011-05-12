require 'spec_helper'

describe Request do
  it "should return a list of distinct controllers for which there qare requests" do
    r1 = Request.create! :first_lineno => 1, :last_lineno => 2
    r2 = Request.create! :first_lineno => 4, :last_lineno => 5
    r3 = Request.create! :first_lineno => 6, :last_lineno => 8

    ProcessingLine.create! :controller => 'A', :request_id => r1.id
    ProcessingLine.create! :controller => 'A', :request_id => r2.id
    ProcessingLine.create! :controller => 'C', :request_id => r1.id

    Request.get_distinct_controllers.should == { :controllers => ['A', 'C']}
  end
end
