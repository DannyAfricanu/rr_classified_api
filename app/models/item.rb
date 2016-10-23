class Item < ApplicationRecord
  enum category: [:car,:clothing,:others]
  enum status: [:available,:pending,:sold,:expired,:banned]
end
