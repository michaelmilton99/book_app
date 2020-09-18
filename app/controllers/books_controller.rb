class BooksController < ApplicationController
    # Show all books in the index
    def index
        @books = Book.all
    end
    
    # Loads book to be shown when the "Show" button is clicked next to a book
    def show
        @book = Book.find(params[:id])
        flash[:msg] = "Show Successful"
    end
    
    # Creates an empty book instance to be filled in on the "Create Book" form
    # when the "New Book" button is pressed
    def new
        @book = Book.new
    end
    
    # Loads book to be edited when the "Edit" button is clicked next to a book
    def edit
        @book = Book.find(params[:id])
    end
    
    # Called when the "Save Book" button is clicked on the "New Book" form
    def create
        @book = Book.new(article_params)
        
        # Check the fields were valid
        # If so, save the book. Otherwise, re-show the form
        if @book.save
            flash[:msg] = "Creation Successful"
            redirect_to books_path
        else
            render 'new'
        end
    end
    
    # Called when the "Save Book" button is clicked on the "Edit" form
    def update
        @book = Book.find(params[:id])
        
        # Check the fields were valid
        # If so, save the book. Otherwise, re-show the form
        if @book.update(article_params)
            flash[:msg] = "Update Successful"
            redirect_to books_path
        else
            render 'edit'
        end
    end
    
    # Deletes a book when the "Delete" button is clicked next to that book
    def destroy
        # Find the book by the given ID and destroy it
        @book = Book.find(params[:id])
        @book.destroy
        
        flash[:msg] = "Delete Successful"
        
        # Reload the book index
        redirect_to books_path
    end
    
    private
        # Make all fields required
        def article_params
            params.require(:book).permit(:Title, :Genre, :Author, :Price, :Published)
        end
end
