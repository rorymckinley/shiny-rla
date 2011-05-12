require 'spec_helper'

describe RequestControllersController do
  before(:each) do
    r1 = Request.create! :first_lineno => 1, :last_lineno => 2
    r2 = Request.create! :first_lineno => 4, :last_lineno => 5
    r3 = Request.create! :first_lineno => 6, :last_lineno => 8

    ProcessingLine.create! :controller => 'A', :request_id => r1.id, :action => 'method_one', :timestamp => '20110101000000'
    ProcessingLine.create! :controller => 'A', :request_id => r1.id, :action => 'method_one', :timestamp => '20110101000000'
    ProcessingLine.create! :controller => 'A', :request_id => r1.id, :action => 'method_one', :timestamp => '20110101000000'
    ProcessingLine.create! :controller => 'A', :request_id => r1.id, :action => 'method_one', :timestamp => '20110102000000'
    ProcessingLine.create! :controller => 'A', :request_id => r1.id, :action => 'method_one', :timestamp => '20110103000000'
    ProcessingLine.create! :controller => 'A', :request_id => r2.id, :action => 'method_two', :timestamp => '20110102000000'
    ProcessingLine.create! :controller => 'C', :request_id => r1.id, :action => 'method_three', :timestamp => '20110103000000'
  end

  it "should return a distinct list of the controllers for which there are requests" do
    get :index, :filter => 'distinct'
    response.should be_ok
    ActiveSupport::JSON.decode(response.body).should == { 'controllers' => ['A', 'C']}
  end

  it "should return a list of distinct methods for a selected controller" do
    get :show, :id => 'A'
    response.should be_ok
    ActiveSupport::JSON.decode(response.body).should == { 'methods' => [ 'method_one', 'method_two']}
  end
end
