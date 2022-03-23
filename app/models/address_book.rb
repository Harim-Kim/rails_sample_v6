class AddressBook < ApplicationRecord
  validates :name,  :presence => true
  validates :name,   format: {with: /^[가-힣]+$/, message: "한글 및 띄어쓰기만 입력 가능합니다(자음 혹은 모음만 입력 불가)"}
  validates :age,   :presence => true
  validates :age,   comparison: {less_than: 20}
  validates :age,   numericality: {only_integer: true}

end
