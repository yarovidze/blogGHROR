class Like < ApplicationRecord
  belongs_to :author
  belongs_to :comment
end
