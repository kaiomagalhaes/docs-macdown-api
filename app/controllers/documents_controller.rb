# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :set_document, only: %i[show]

  # GET /documents
  def index
    @documents = Document.all

    render json: @documents, each_serializer: DocumentSerializer
  end

  # GET /documents/1
  def show
    render json: @document
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find(params[:id])
  end
end
