class SummariesController < ApplicationController
  def index
    @summaries = Summary.all
  end

end