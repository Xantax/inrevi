Inrevi::Application.routes.draw do
  root 'static_pages#home'
  
  get "static_pages/advertising"
  get "static_pages/faq"

end
