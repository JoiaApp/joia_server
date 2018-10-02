require 'spec_helper'
require 'rails_helper'

describe PromptsController, :type => :controller do
  it "should return list of prompts" do
    get :index 
    expect(assigns(:prompts)).to eq([])
  end
end
