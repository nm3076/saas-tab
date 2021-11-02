class WelcomeController < ApplicationController
    def index
        @workspaces = Workspace.all
    end
end
