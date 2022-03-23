class AddressBook < ApplicationRecord
  before_destroy :phone_number_destroy_validation, prepend: true

  validates :name,  :presence => true,
            format: { with: /\A[가-힣]+\z/,
                      message: "should be korean with valid" }
  validates :age,   :presence => true,
            numericality: { only_integer: true }
  validate :age_cannot_be_greater_than
  validates :phone_number, numericality: { only_integer: true }

  private

    def age_cannot_be_greater_than
      if age && age > 20
        errors.add(:age, "age greater than 20 can not be saved")
      end
    end
    #
    def phone_number_destroy_validation
      unless phone_number.start_with? "02"
        errors.add(:phone_number, "Only phone number starts with 02 could be destroyed")
        throw :abort
      end
    end
end
