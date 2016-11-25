class TeamsController < ApplicationController

  before_action :set_team, only: [:show, :edit, :update, :destroy]
#  before_action :require_login, only: [:new, :edit, :update, :destroy]
  before_action :signed_in?, only: [:new, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id

    respond_to do |format|
      if @team.save!
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
    end
  end

private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :league)
    end

    def signed_in?
      unless current_user
        redirect_to team_path, :alert => "Access denied."
      end
    end

    def authorize_user!
      unless current_user == @team.user_id || current_user.admin?
        redirect_to team_path(id: @team.id), :alert => "Access denied."
      end
    end
end
