class LinksController < ApplicationController
    def index
        @links = Link.all
    end

    def show
        @links = Link.all
    end
end
