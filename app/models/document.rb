# frozen_string_literal: true

class Document < ApplicationRecord
  belongs_to :folder, required: false
end
