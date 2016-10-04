class ContentsController < ProtectedController
  before_action :set_content, only: [:update, :destroy]

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
