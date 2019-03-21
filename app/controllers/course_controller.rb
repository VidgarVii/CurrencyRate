class CourseController < ApplicationController
  def index
    @pairs = CurrencyPair.all
  end

end
