# frozen_string_literal: true

class FolderSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :descendants, :ancestors, :ancestry, :documents
end
