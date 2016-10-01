class ListsController < ProtectedController
  before_action :set_list, only: [:show, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = current_user.lists.all.order(created_at: :desc)

    render json: @lists
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    render json: @list
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = current_user.lists.build(list_params)

    if @list.save
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    if @list.update(list_params)
      head :no_content
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy

    head :no_content
  end

  private

  def set_list
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :user_id)
  end
end
