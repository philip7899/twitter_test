class TweetsController < ApplicationController

	before_action :authenticate_user!

	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.create(tweet_params)
		flash[:success] = "Tweet Created"
		redirect_to new_tweet_path
	end

	private

	def tweet_params
		params.require(:tweet).permit(:content)
	end
end
