class PostsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  before_filter :create_stupid_headers
  layout :choose_layout

  def index
    @posts = Post.page(params[:page]).per(10).where(draft:false)

    respond_to do |format|
      format.html
      format.xml { render :xml => @posts }
      format.rss { render :layout => false }
    end
  end

  def preview
    @post = Post.new(params[:post])
    @preview = true
    respond_to do |format|
      format.html { render 'show' }
    end
  end

  def admin
    @no_header = true
    @post = Post.new
    @published = Post.where(draft:false).page(params[:post_page]).per(20)
    @drafts = Post.where(draft:true).page(params[:draft_page]).per(20)

    respond_to do |format|
      format.html
    end
  end

  def show
    session[:text] = 'banana'
    @single_post = true
    @post = admin? ? Post.find_by_slug(params[:slug]) : Post.find_by_slug_and_draft(params[:slug],false)

    respond_to do |format|
      if @post.present?
        format.html
        format.xml { render :xml => @post }
      else
        format.any { head status: :not_found  }
      end
    end
  end

  def new
    @no_header = true
    @posts = Post.page(params[:page]).per(20)
    @post = Post.new

    respond_to do |format|
      format.html
      format.xml { render xml: @post }
    end
  end

  def edit
    @no_header = true
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to "/blog/edit/#{@post.id}", :notice => "Post created successfully" }
        format.xml { render :xml => @post, :status => :created, location: @post }
      else
        format.html { render :action => 'new' }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity}
      end
    end
  end

  def update
    @post = Post.find_by_slug(params[:slug])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to "blog/edit/#{@post.id}", :notice => "Post updated successfully" }
        format.xml { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    @post = Post.find_by_slug(params[:slug])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to '/blog' }
      format.xml { head :ok }
    end
  end

  private

  def admin?
    session[:admin] == true
  end

  def choose_layout
    if ['admin', 'new', 'edit', 'create'].include? action_name
      'blog_admin'
    else
      'blog'
    end
  end

  def create_stupid_headers
    @possible_marquees = [
      'Rad naner lives again!', 
      'When was the last time you saw a marquee element?',
      'Life should have more burritos.',
      'Are you sure you want to delete System32?',
      'More cat love than your local librarian.',
      'Not with that finger!',
      'Can I go outside yet?',
      'Now accepting applications for tattoo artists.',
      'Remember when it used to whip the llamas ass? What happened?',
      'For some reason I just cant seem to enjoy techno music for more than 20 minutes.',
      'I want to ride bikes till my legs fall off.',
      'Turtle Power!',
      'Je suis le egg man.',
      'Best video game ever? Diablo II, or get out of my house.',
      'FALCON PUNCH!',
      'Mo money, mo discreet electronics projects.',
      "What does the phrase 'the DH is BS' mean to you? I saw on a sticker once.",
      'Tropical island adventure!',
      'Whiskey: not a vegetable.'
    ]
  end
end
