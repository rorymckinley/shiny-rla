class Request < ActiveRecord::Base
  def self.get_distinct_controllers
    { :controllers => ProcessingLine.find(:all, :select => 'DISTINCT controller').map { |pl| pl.controller }}
  end
end
