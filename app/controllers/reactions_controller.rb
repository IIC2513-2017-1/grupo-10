# frozen_string_literal: true

class ReactionsController < ApplicationController
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def react
    @before_reaction = Reaction.find_by(user_id: params[:user_id],
                                        raffle_id: params[:raffle_id])
    if @before_reaction
      unless @before_reaction.reaction_representation_id ==
             params[:reaction_representation_id].to_i
        @reaction = Reaction.create reaction_params
      end
      @before_reaction.destroy
    else
      @reaction = Reaction.create reaction_params
    end
    respond_to do |format|
      format.js { render layout: false, action: 'react' }
    end
  end

  private

  def reaction_params
    params.permit(:user_id,
                  :reaction_representation_id,
                  :raffle_id)
  end
end
