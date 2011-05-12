require 'spec_helper'

describe Request do
  before(:each) do
    r1 = Request.create! :first_lineno => 1, :last_lineno => 2
    r2 = Request.create! :first_lineno => 4, :last_lineno => 5
    r3 = Request.create! :first_lineno => 6, :last_lineno => 8

    ProcessingLine.create! :controller => 'A', :request_id => r1.id, :action => 'method_one'
    ProcessingLine.create! :controller => 'A', :request_id => r1.id, :action => 'method_one'
    ProcessingLine.create! :controller => 'A', :request_id => r2.id, :action => 'method_two'
    ProcessingLine.create! :controller => 'C', :request_id => r1.id, :action => 'method_three'
  end
  it "should return a list of distinct controllers for which there qare requests" do
    Request.get_distinct_controllers.should == { :controllers => ['A', 'C']}
  end

  it "should return a list of distinct methods for a selected controller" do
    Request.get_distinct_methods_for('A').should == { :methods => ['method_one', 'method_two']}
  end
end
