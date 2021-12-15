class UsersController < ApplicationController
    def show
        @user =  current_user
        @workspaces = @user.workspaces
    end
    
    def new
      #@user = User.new
    if logged_in?
        redirect_to root_path
    else
        @user = User.new
    end
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = "Welcome to the tab!"
        redirect_to workspaces_path
      else
        render 'new'
      end
    end
    
    def edit
      @user = User.find(params[:id])
    end
    
    private

      def user_params
        params.require(:user).permit(:username, :email, :first_name,
                                      :last_name, :password, :password_confirmation)
      end

end
