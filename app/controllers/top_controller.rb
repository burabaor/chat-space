class TopController < ApplicationController

  def index
    @all_groups = Group.all
  end

end
