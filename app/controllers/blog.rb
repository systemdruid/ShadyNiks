Shadyniks::App.controllers :blog do
  
  get :index do
    @posts = JSON.parse(Post.all.to_json)
    render 'blog/index'
  end

  get :read, :with => :name do
    @post = JSON.parse(Post.by_name(params[:name]).to_json)[0]
    @post["body"] = Post.makePretty(@post["body"])
    render 'blog/show'
  end

end
