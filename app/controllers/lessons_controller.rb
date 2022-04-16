class LessonsController < ApplicationController
  # GET /lessons
  def index
    @lessons = Lesson.all
    render json: @lessons
  end

  # GET /lessons/1
  def show
    render json: @lesson
  end

  # POST /lessons
  def create
    print(lesson_params)
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      lessons = Lesson.all
      render json: lessons, status: :created, location: @lessons
    else
      render json: @lesson.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lessons/1
  def update
    if @lesson.update(lesson_params)
      render json: @lesson
    else
      render json: @lesson.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lessons/1
  def destroy
    @id = @lesson.id
    @lesson.destroy
    lessons = Lesson.all
    render json: lessons, location: @lessons
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params[:lesson].permit(:name, :description, :grade, :subject, content:"eh")
    end
end
