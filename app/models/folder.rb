# frozen_string_literal: true

class Folder < ApplicationRecord
  belongs_to :parent, class_name: 'Folder', required: false

  has_many :sub_folders, class_name: 'Folder', foreign_key: 'parent_id', dependent: :destroy

  validates :name, presence: true, allow_blank: false
end
