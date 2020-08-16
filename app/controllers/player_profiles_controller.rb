require 'twitter'

class PlayerProfilesController < ApplicationController

    before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

    def search
        @player_profile = PlayerProfile.where('playerTag LIKE ?', '%' + params[:q] + '%' )
    end

    #def manage
        #@manage_player_profile = PlayerProfile.where('manager_profile_id LIKE ?', current_user.manager_profile.id)


        #@client = Twitter::REST::Client.new do |config|
            #config.consumer_key        = "NoSQIiHJUVYg5VseZAWEhUBrS"
            #config.consumer_secret     = "XVoumcEH0f21M9JZKkpKaJX7P6vdZcP8eO6v4NfjC9e9NoQV9V"
            #config.access_token        = "513730483-5oRBjvhWcgyvPNyOUFtrCie0IC9BTVBKwG9AlQhS"
            #config.access_token_secret = "sbRzMKNePlj3OlSINQDZJQVxBhFViHHuTAt59jId6few6"
        #end
    #end
    
    def show
        @player_profile = PlayerProfile.find(params[:id])

        @client = Twitter::REST::Client.new do |config|
            config.consumer_key        = "NoSQIiHJUVYg5VseZAWEhUBrS"
            config.consumer_secret     = "XVoumcEH0f21M9JZKkpKaJX7P6vdZcP8eO6v4NfjC9e9NoQV9V"
            config.access_token        = "513730483-5oRBjvhWcgyvPNyOUFtrCie0IC9BTVBKwG9AlQhS"
            config.access_token_secret = "sbRzMKNePlj3OlSINQDZJQVxBhFViHHuTAt59jId6few6"
        end
    end

    def new
        @player_profile = PlayerProfile.new
    end

    def create
        @player_profile = PlayerProfile.new(player_profile_params)
        @player_profile.save
        redirect_to @player_profile
    end

    def edit
        @player_profile = PlayerProfile.find(params[:id])
    end

    def update
        #if @player_profile.update(player_profile_params)
            #redirect_to edit_player_profiles_path(@player_profile), notice: "Player Profile successfully updated."
        #else
            #render :edit
        #end

        @player_profile = PlayerProfile.find(params[:id])
        
        if @player_profile.update(player_profile_params)
            redirect_to @player_profile, notice: "Player Profile successfully updated."
        else
            render 'edit'
        end

        #@player_profile = PlayerProfile.find(params[:id])
        #@player_profile.update(player_profile_params)
        #redirect_to @player_profile

    end

    def destroy
        @player_profile.destroy
        redirect_to player_profiles_url, notice: 'Player Profile was deleted.'
    end

    private
        #def set_player_profile
            #@player_profile = PlayerProfile.find(params[:id])
        #end

        def player_profile_params
            params
                .require(:player_profile)
                .permit(:user_id, :playerTag, :bio, :firstName, :lastName, :dob, :country_id, :twitterHandle, :twitchHandle, :manager_profile_id, :hasSponsor)
        end
end
