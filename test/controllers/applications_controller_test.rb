require 'test_helper'

class ApplicationsControllerTest < ActionController::TestCase
  setup do
    @application = applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create application" do
    assert_difference('Application.count') do
      post :create, application: { activity: @application.activity, business_model: @application.business_model, company_description: @application.company_description, company_name: @application.company_name, customers: @application.customers, email: @application.email, founding_date: @application.founding_date, founding_team: @application.founding_team, funding_to_date: @application.funding_to_date, future: @application.future, nif: @application.nif, pitch_url: @application.pitch_url, product_description: @application.product_description, state: @application.state, team_description: @application.team_description, user_id: @application.user_id, website_url: @application.website_url }
    end

    assert_redirected_to application_path(assigns(:application))
  end

  test "should show application" do
    get :show, id: @application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @application
    assert_response :success
  end

  test "should update application" do
    patch :update, id: @application, application: { activity: @application.activity, business_model: @application.business_model, company_description: @application.company_description, company_name: @application.company_name, customers: @application.customers, email: @application.email, founding_date: @application.founding_date, founding_team: @application.founding_team, funding_to_date: @application.funding_to_date, future: @application.future, nif: @application.nif, pitch_url: @application.pitch_url, product_description: @application.product_description, state: @application.state, team_description: @application.team_description, user_id: @application.user_id, website_url: @application.website_url }
    assert_redirected_to application_path(assigns(:application))
  end

  test "should destroy application" do
    assert_difference('Application.count', -1) do
      delete :destroy, id: @application
    end

    assert_redirected_to applications_path
  end
end
