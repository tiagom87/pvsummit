class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :accept, :reject]
  before_action :authenticate_user!


  # GET /applications/1
  # GET /applications/1.json
  def index
    if current_user.admin == true
      @applications = Application.where.not(aasm_state: "started").order("applied_at DESC")
    else
      redirect_to root_path
    end
  end

  def show
    if @application.aasm_state == "started"
      redirect_to edit_application_path(@application)
    end
  end

  # GET /applications/1/edit
  def edit
    unless @application.aasm_state == "started"
      redirect_to application_path(@application), error: "You have already submitted this application"
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
          if @application.temp_state == "Apply"
            @application.apply!
            @application.update_attributes(applied_at: Time.now)
            format.html { redirect_to @application, success: 'Application was successfully Applied.' }
            UserMailer.application_applied(@user)
            UserMailer.pv_application_accepted(@user)
          else
            format.html { redirect_to edit_application_path(@application), notice: 'Application was Saved.' }
          end
      else
        format.html { render :edit }
      end
    end
  end

  def accept
    @application.accept!
    redirect_to applications_path, success: "Application was successfully accepted"
    UserMailer.application_accepted(@user)
  end

  def reject
    @application.reject!
    redirect_to applications_path, success: "Application was successfully rejected"
    UserMailer.application_rejected(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:company_name, :company_description, :website_url, :nif, :founding_team, :team_description, :email, :founding_date, :funding_to_date, :product_description, :customers, :future, :pitch_url, :pitch_name, :temp_state)
    end
end
