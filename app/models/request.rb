class Request < ActiveRecord::Base
  def self.get_distinct_controllers
    { :controllers => ProcessingLine.find(:all, :select => 'DISTINCT controller').map { |pl| pl.controller }}
  end
  def self.get_distinct_methods_for(controller)
    { :methods => ProcessingLine.find(:all, :select => 'DISTINCT action', :conditions => { :controller => controller }).map { |pl| pl.action }}
  end
end
