module Projects
  class ConnectFourController < ApplicationController
    def show
      render :show, layout: "projects/connect_four"
    end
  end
end
