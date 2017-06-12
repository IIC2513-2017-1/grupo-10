# frozen_string_literal: true

class ReactionRepresentationController < ApplicationController
  # rubocop:disable Metrics/MethodLength
  def index
    @reactions = ReactionRepresentation.all
  end

  def new
    @reaction = ReactionRepresentation.new
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def create
    @reaction = ReactionRepresentation.new reaction_params
    respond_to do |format|
      if @reaction.save
        format.html do
          redirect_to reactions_path, notice: 'Reaction successfully created.'
        end
      else
        format.html do
          redirect_to reactions_path, notice: 'Reaction can\'t be created.'
        end
      end
    end
  end

  def destroy
    @reaction = ReactionRepresentation.find params[:id]
    @reaction.destroy
    redirect_to reactions_path, notice: 'Reaction successfully destroyed.'
  end

  private

  def logged_in
    return if current_user&.admin?
    redirect_to root_path
  end

  def reaction_params
    params.require(:reaction_representation).permit(:description, :image)
  end
end
