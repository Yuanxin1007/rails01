class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

   def new
   @group = Group.new
  end

def edit
  @group = Group.find(params[:id])
end

def create
  @group = Group.new(group_pramas)
  @group.save
  redirect_to groups_path
end

  def show
    @group = Group.find(params[:id])
  end

private

def group_pramas
  params.require(:group).permit(:title, :description)

end

end
