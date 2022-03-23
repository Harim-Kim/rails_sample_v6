json.extract! address_book, :id, :name, :age, :phone_number, :created_at, :updated_at
json.url address_book_url(address_book, format: :json)
