# frozen_string_literal: true

class ReactionsController < ApplicationController
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def react
    @before_reaction = Reaction.find_by(user_id: params[:user_id],
                                        raffle_id: params[:raffle_id])
    if @before_reaction
      p @before_reaction.reaction_representation_id
      p params[:reaction_representation_id]
      unless @before_reaction.reaction_representation_id ==
             params[:reaction_representation_id].to_i
        @reaction = Reaction.new reaction_params
        if @reaction.save
          respond_to do |format|
            format.js { render layout: false, action: 'replace' }
          end
        end
      end
      @before_reaction.destroy
    else
      @reaction = Reaction.new reaction_params
      if @reaction.save
        respond_to do |format|
          format.js { render layout: false, action: 'create' }
        end
      end
    end
  end

  private

  def reaction_params
    params.permit(:user_id,
                  :reaction_representation_id,
                  :raffle_id)
  end
end
