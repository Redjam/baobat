class PagesController < ApplicationController
	before_action :enable_home_page_header, only: [:home]	

  def home
  end

  def who_we_are
  end

private

  def enable_home_page_header
  	@enable_home_page_header = true
  end
end
