class MentionsController < ApplicationController

  # POST /responses
  # POST /responses.json
  def create
    @group = Group.find_by_guid(params[:group_id])
    create_params = params[:mention]
    @mention = Mention.new(create_params)

    respond_to do |format|
      if @mention.save
        format.html { redirect_to @mention, notice: 'Mention was successfully created.' }
        format.json { render json: @mention, status: :created, location: @mention }
      else
        format.html { render action: "new" }
        format.json { render json: @mention.errors, status: :unprocessable_entity }
      end
    end
  end

end
