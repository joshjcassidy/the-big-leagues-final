class ManagerProfilesController < ApplicationController
    
    before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

    def show
        @manager_profile = ManagerProfile.find(params[:id])
    end
    
    def new
        @manager_profile = ManagerProfile.new
    end

    def create
        @manager_profile = ManagerProfile.new(manager_profile_params)
        @manager_profile.save
        redirect_to @manager_profile

        #if @manager_profile.save
            #redirect_to edit_manager_profiles_path(@manager_profile), notice: 'Team Profile successfully registered.'
        #else
            #render :new
        #end
    end

    def edit
        @manager_profile = ManagerProfile.find(params[:id])
    end

    def update
        @manager_profile = ManagerProfile.find(params[:id])
        
        if @manager_profile.update(manager_profile_params)
            redirect_to @manager_profile, notice: "Team Profile successfully updated."
        else
            render 'edit'
        end

        #@manager_profile = ManagerProfile.find(params[:id])
        #@manager_profile.update(manager_profile_params)
        #redirect_to @manager_profile
    end

    def destroy
        @manager_profile.destroy
        redirect_to manager_profiles_url, notice: 'Team Profile was deleted.'
    end

    private
        def manager_profile_params
            params
                .require(:manager_profile)
                .permit(:user_id, :teamName, :description, :country_id, :managerFName, :managerLName, :sponsorsAndPartners, :twitterHandle, :siteUrl)
        end
end
