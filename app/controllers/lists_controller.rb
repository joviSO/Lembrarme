class ListsController < ApplicationController
  before_action :require_login, only: [:new, :create, :update, :destroy]
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    sort_column = params[:order].presence || "id"
    sort_direction = params[:direction].presence || "asc"

    @lists = current_user.present? ? current_user.lists.includes(:items)
                                                 .page(params[:page])
                                                 .order(apply_sorting(sort_column, sort_direction)) : List.none.page(params[:page])
  end

  def new
    @list = List.new
    @list.items.build
  end

  def create
    @list = List.new(list_params)

    if @list.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to lists_path, notice: "Lista foi criada com sucesso" }
        redirect_to lists_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @list.items.build
  end

  def update
    if @list.update(list_params)
      respond_to do |format|
        format.turbo_stream
        redirect_to lists_path, notice: "Lista atualizada com sucesso!"
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: "Lista apagada com sucesso!"
  end

  def show; end

  private

  def set_list
    @list = List.find(params[:id])
    end

  def list_params
    params.require(:list).permit(:title, :category, :deadline, :status, :repeat, :repeat_end, :user_id,
                                 items_attributes: [:id, :description, :checked, :_destroy])
  end

  def apply_sorting(column, direction)
    case column
    when "title"
      Arel.sql("LOWER(title) #{sanitize_direction(direction)}")
    when "category"
      "#{column} #{sanitize_direction(direction)}"
    when "deadline"
      Arel.sql("deadline IS NULL, deadline #{sanitize_direction(direction)}")
    else
      "#{column} #{sanitize_direction(direction)}"
    end
  end

    def sanitize_direction(direction)
      %w[asc desc].include?(direction) ? direction.upcase : "ASC"
    end
end