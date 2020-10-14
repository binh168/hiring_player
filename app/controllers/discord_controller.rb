require "discordrb"

class DiscordController < ApplicationController
  def create
    bot = Discordrb::Bot.new token: ENV["DISCORD_ID"]
    bot.run :async
    server = bot.create_server "#{current_user.name}_#{params[:name]}", region = :"hongkong"
    invite = server.general_channel.make_invite.url

    @discord = Discord.new discord_url: invite
    ActiveRecord::Base.transaction do
      if @discord.save!
        @discord_actionable = current_user.active_discord.build receiver_id: params[:id], actionable: @discord, checked: true       
        if @discord_actionable.save!
          redirect_to invite
        else
          redirect_to request.referrer
        end
      else
        redirect_to request.referrer || root_path
      end
    end
  end
end
