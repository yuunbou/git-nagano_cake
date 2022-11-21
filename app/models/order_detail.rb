class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :otder

  eunm making_status: { impossible: 0, wait: 1, production: 2, complete: 3}


end
