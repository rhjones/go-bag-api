class ContentsController < ProtectedController
  before_action :set_content, only: [:show, :update, :destroy]

  # GET /contents/list/7
  # GET TK
  def index_for_list
    # some sort of error checking
    # don't want users to be able to access contents of a list that isn't theirs
    # do I even need this, or can I just get list.contents? seems better...
    @contents = Content.where("list_id = '#{params[:list_id]}'")
    render json: @contents
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    render json: @content
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)

    if @content.save
      render json: @content, status: :created, location: @content
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    if @content.update(content_params)
      head :no_content
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy

    head :no_content
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:item_id, :list_id, :packed)
  end
end
