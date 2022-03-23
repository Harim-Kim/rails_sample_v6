class AddressBooksController < ApplicationController
  before_action :set_address_book, only: %i[ show edit update destroy ]

  # GET /address_books or /address_books.json
  def index
    @address_books = AddressBook.all
  end

  # GET /address_books/1 or /address_books/1.json
  def show
  end

  # GET /address_books/new
  def new
    @address_book = AddressBook.new
  end

  # GET /address_books/1/edit
  def edit
  end

  # POST /address_books or /address_books.json
  def create
    @address_book = AddressBook.new(address_book_params)

    respond_to do |format|
      if @address_book.save
        format.html { redirect_to address_book_url(@address_book), notice: "Address book was successfully created." }
        format.json { render :show, status: :created, location: @address_book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /address_books/1 or /address_books/1.json
  def update
    respond_to do |format|
      if @address_book.update(address_book_params)
        format.html { redirect_to address_book_url(@address_book), notice: "Address book was successfully updated." }
        format.json { render :show, status: :ok, location: @address_book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /address_books/1 or /address_books/1.json
  def destroy
    respond_to do |format|
      if @address_book.destroy
        format.html { redirect_to address_books_url, notice: "Address book was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { redirect_to address_books_url, alert: "Only phone number starts with 02 could be destroyed" }
        format.json { render json: @address_book.errors, status: :unprocessable_entity }
      end
    end
 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address_book
      @address_book = AddressBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_book_params
      params.require(:address_book).permit(:name, :age, :phone_number)
    end
end
