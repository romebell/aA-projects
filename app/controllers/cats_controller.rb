class CatsController < ApplicationController
  def index
        @cats = Cat.all
        # render json: cats
    end
  
  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
        
        cat = Cat.new(cat_params)

        if cat.save
            # render json: user
            redirect_to cat_url(cat)
        else
            render json: cat.errors.full_messages
        end
    end

    def edit
      @cat = Cat.find(params[:id])
    end

    def update
      cat = Cat.find(params[:id])

      if cat.update(cat_params)
        redirect_to cat_url(cat)
      else
        render json: cat.erros.full_messages, status: 422
      end
    end

    private

    def cat_params
        params.require(:cat).permit(:name, :color, :description, :birth_date, :sex)
    end 
end