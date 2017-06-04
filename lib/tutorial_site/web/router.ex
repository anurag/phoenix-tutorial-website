defmodule TutorialSite.Web.Router do
  use TutorialSite.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TutorialSite.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/read", PageController, :read_book
    get "/read/:section/:chapter", PageController, :read_chapter
    get "/buy_ebook", PaymentController, :buy_ebook
    get "/buy_videos", PaymentController, :buy_videos    
    get "/mailing_list", PageController, :mailing_list
    get "/contact", PageController, :contact
  end

  # Other scopes may use custom stacks.
  # scope "/api", TutorialSite do
  #   pipe_through :api
  # end
end
