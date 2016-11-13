require 'test_helper'

class PromptsControllerTest < ActionController::TestCase
  setup do
    @prompt = prompts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prompts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prompt" do
    assert_difference('Prompt.count') do
      post :create, prompt: {  }
    end

    assert_redirected_to prompt_path(assigns(:prompt))
  end

  test "should show prompt" do
    get :show, id: @prompt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prompt
    assert_response :success
  end

  test "should update prompt" do
    put :update, id: @prompt, prompt: {  }
    assert_redirected_to prompt_path(assigns(:prompt))
  end

  test "should destroy prompt" do
    assert_difference('Prompt.count', -1) do
      delete :destroy, id: @prompt
    end

    assert_redirected_to prompts_path
  end
end
