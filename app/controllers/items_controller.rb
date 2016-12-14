class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authorise, only: [:new, :create, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end
  
  def purchase
	if signed_in?
	@item = Item.find(params[:item_id])
	@item.assign_attributes({ :buyer => @current_user.username})
	@item.assign_attributes({ :sold => true})
	@item.save
	flash[:notice] = 'You have successfully purchased an item'
	redirect_to(:back)
	end
  end
  
    def rate1
	@rating = Rating.new
	@item = Item.find(params[:item_id])
	@rating.score = 1
	@rating.item_id = @item.id
	@rating.save
	redirect_to(:back)
	end
	
	def rate2
	@rating = Rating.new
	@item = Item.find(params[:item_id])
	@rating.score = 2
	@rating.item_id = @item.id
	@rating.save
	redirect_to(:back)
	end
	
	def rate3
	@rating = Rating.new
	@item = Item.find(params[:item_id])
	@rating.score = 3
	@rating.item_id = @item.id
	@rating.save
	redirect_to(:back)
	end
	
	def rate4
	@rating = Rating.new
	@item = Item.find(params[:item_id])
	@rating.score = 4
	@rating.item_id = @item.id
	@rating.save
	redirect_to(:back)
	end
	
	def rate5
	@rating = Rating.new
	@item = Item.find(params[:item_id])
	@rating.score = 5
	@rating.item_id = @item.id
	@rating.save
	redirect_to(:back)
	end
  
  def search
	@items = Item.search params[:query]
	unless @items.empty?
		render 'index'
	else
		flash[:notice] = 'No record matches that search'
		render 'index'
	end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
	@item.location = @current_user.address
	@item.image = "";
	@item.user_id = @current_user.id
	@item.buyer = "";
	@item.sold = false;

    respond_to do |format|
      if @item.save
        format.html { redirect_to (:back), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :image, :price, :location, :category_id, :user_id, :buyer, :sold, :attachment)
    end
end
