class RootController < ApplicationController
  def cli
    @languages = Language.all
  end
end
