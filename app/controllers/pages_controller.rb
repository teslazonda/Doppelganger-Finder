class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @doppelgangers = Doppelganger.all
  end
end
