module Mixpanel
  def tracker
    Mixpanel::Tracker.new( ENV['PROJECT_TOKEN'] )
  end
end