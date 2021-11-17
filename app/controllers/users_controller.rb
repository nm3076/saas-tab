class UsersController < ApplicationController
    def show
        @user =  current_user
        #@workspaces = @user.workspaces.paginate(page: params[:page])
    end
    
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = "Welcome to the tab!"
        redirect_to @user
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

      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
      end
end
