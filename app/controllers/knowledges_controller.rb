class KnowledgesController < ApplicationController
  before_action :login_required, :no_locked_required, except: [:index, :show, :search, :feed]
  before_action :find_knowledge, only: [:edit, :update, :trash]
  
  def index
    @knowledges = Knowledge.includes(:category).page(params[:page])
    if params[:category_id]
      @category = Category.where('lower(slug) = ?', params[:category_id].downcase).first!
      @parent_category = Category.find(@category.parent_id)
      @categories = Category.where(parent_id: @parent_category.id)
      @knowledges = @knowledges.where(category: @category)
    end
  end

  def search
    @knowledges = Knowledge.search(
      query: {
        multi_match: {
          query: params[:q].to_s,
          fields: ['title', 'body']
        }
      },
      filter: {
        term: {
          trashed: false
        }
      }
    ).page(params[:page]).records
  end

  def feed
    @knowledges = Knowledge.all
    render layout: false
  end


  def show
    @knowledge = Knowledge.find params[:id]
    @category = Category.find(@knowledge.category)
  end

  def new
    @category = Category.where('lower(slug) = ?', params[:category_id].downcase).first if params[:category_id].present?
    @knowledge = Knowledge.new category: @category
  end

  def create
    @knowledge = current_user.knowledges.create knowledge_params
  end

  def edit
  end

  def update
    @knowledge.update_attributes knowledge_params
  end

  def trash
    @knowledge.trash
    redirect_via_turbolinks_to knowledges_path
  end

  private

  def knowledge_params
    params.require(:knowledge).permit(:title, :category_id, :body, :answer, :audio, :remove_audio)
  end

  def find_knowledge
    @knowledge = current_user.knowledges.find params[:id]
  end
end
