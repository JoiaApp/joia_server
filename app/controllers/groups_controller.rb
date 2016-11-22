class GroupsController < ApplicationController

  before_filter :current_user, :if => :json, :except => [:create, :show]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end


  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find_by_guid(params[:id])
    respond_to do |format|
      format.json {
        if @group.password == params[:password]
          render json: @group
        else
          render json: "Forbidden", status: :forbidden
        end
      }
      format.html # show.html.erb
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find_by_guid(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST groups/[guid]/invite
  def invite
    @group = Group.find_by_guid(params[:id])
    InviteMailer.invite_email(params[:email], @group, current_user).deliver
    respond_to do |format|
      format.html { redirect_to @group }
      format.json { head :no_content }
    end
  end

  # POST groups/[guid]/join
  def join
    @group = Group.find_by_guid(params[:id])
    @user = User.find(join_params[:user_id])

    user_group = UserGroup.new(user_id: @user.id, group_id: @group.id)
    respond_to do |format|
      if user_group.save
        format.html { redirect_to @group }
        format.json { render json: @group }
      else
        format.json { render json: { error: user_group.errors.first.second }, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find_by_guid(params[:id])

    respond_to do |format|
      if @group.update_attributes(update_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find_by_guid(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
 
private

  def join_params
    params.permit(:user_id, :group_id)
  end

  def update_params
    params.require(:group).permit(:name)
  end
end
