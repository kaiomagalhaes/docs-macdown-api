# frozen_string_literal: true

class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :folder, :folder_tree

  def folder_tree
    return [] unless @object.folder

    @object.folder.root.subtree
  end
end
