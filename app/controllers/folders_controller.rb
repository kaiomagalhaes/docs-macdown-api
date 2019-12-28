# frozen_string_literal: true

class FoldersController < ApplicationController
  before_action :set_folder, only: %i[show]

  # GET /folders
  def index
    @folders = Folder.all

    render json: @folders, each_serializer: FolderSerializer
  end

  # GET /folders/1
  def show
    render json: @folder
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_folder
    @folder = Folder.find(params[:id])
  end
end
