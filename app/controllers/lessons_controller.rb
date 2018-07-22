class LessonsController < ApplicationController
  before_action :authenticate_user!

  def show
    lesson = Lesson.find(params[:id])
    render json: lesson
  end

  def index
    lessons = Lesson.all
    render json: lessons
  end

  def create
    lesson = Lesson.create!(create_params.merge(creator: current_user))
    render json: lesson, status: :created
  end

  def update
    lesson = Lesson.find(params[:id])
    authorize lesson
    lesson.update!(update_params)
    render json: lesson
  end

  def destroy
    authorize Lesson.find(params[:id]).delete
    head :no_content
  end

  private

  def create_params
<<<<<<< HEAD
    params.require(:lesson).permit(:title, :description, :user_id)
  end

  def update_params
    params.require(:lesson).permit(:title, :description)
=======
    params.require(:lesson).permit(:title, :description, :creator)
>>>>>>> ca72ccb2324edbfa905051b10b2d420266879232
  end
end
