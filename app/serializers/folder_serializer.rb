# frozen_string_literal: true

class FolderSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :descendants, :ancestors, :ancestry

  def ancestors
    @object.ancestors
  end

  def parents
    @object.descendants
  end
end
