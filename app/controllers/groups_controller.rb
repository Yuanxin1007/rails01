class GroupsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
before_action :find_group_and_check_permission, only: [:edit, :update, :destroy]
  def index
    @groups = Group.all
  end

   def new
   @group = Group.new
  end

def edit

end

def create
  @group = Group.new(group_pramas)
  @group.user = current_user

  if @group.save
  redirect_to groups_path
else
  render :new
end
end

def update
  if @group.update(group_pramas)
  redirect_to groups_path, notice: "Update success"
  else
  render :edit
end
end

def show
  @group = Group.find(params[:id])
  @posts = @group.posts
end

def destroy
  @group.destroy
  flash[:alert] = "Group deleted"
  redirect_to groups_path
end

private

def group_pramas
  params.require(:group).permit(:title, :description)
end

def find_group_and_check_permission
  @group = Group.find(params[:id])
  if current_user != @group.user
    redirect_to root_path, alert: "You have no perimission."
  end
end

end
