class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/books' do
    books=Book.all.order(:created_at)
    books.to_json(include: :notes)
  end

  post '/books' do
    book=Book.create(
      title: params[:title],
      author: params[:author],
      genre: params[:genre],
      blurb: params[:blurb],
      image_url: params[:image_url],
      read: false
    )
    book.to_json
  end

  delete '/books/:id' do
    book=Book.find(params[:id])
    book.destroy
    book.to_json
  end

  patch '/books/:id' do
    book=Book.find(params[:id])
    book.update(
      title: params[:title],
      author: params[:author],
      genre: params[:genre],
      blurb: params[:blurb],
      image_url: params[:image_url],
      read:params[:read]
    )
    book.to_json
  end

  patch '/notes/:id' do
    note=Note.find(params[:id])
    note.update(
      rating: params[:rating],
      pages_read: params[:pages_read],
      body: params[:body]
    )
    note.to_json
  end

  post '/notes' do
    note=Note.create(
      rating: params[:rating],
      pages_read: params[:pages_read],
      body: params[:body],
      book_id: params[:book_id],
    )
    note.to_json
  end

 delete '/notes/:id' do
    note=Note.find(params[:id])
    note.destroy
    note.to_json
 end

end
