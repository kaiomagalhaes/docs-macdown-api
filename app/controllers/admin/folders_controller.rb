# frozen_string_literal: true

module Admin
  class FoldersController < AdminController
    before_action :set_folder, only: %i[show update destroy]

    # POST /admin/folders
    def create
      @folder = Folder.new(folder_params)

      if @folder.save
        render json: @folder, status: :created, location: @folder
      else
        render json: @folder.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /admin/folders/1
    def update
      if @folder.update(folder_params)
        render json: @folder
      else
        render json: @folder.errors, status: :unprocessable_entity
      end
    end

    # DELETE /admin/folders/1
    def destroy
      @folder.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def folder_params
      params.require(:folder).permit(:name, :content, :parent_id)
    end
  end
end
