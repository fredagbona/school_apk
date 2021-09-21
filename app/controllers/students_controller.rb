class StudentsController < ApplicationController

  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
      if params[:back]
        render :new
      else
        if @student.save
          redirect_to students_path, notice: "Elève enregistré !"
        else 
          render :new 
        end
      end
  end

  def show
    
  end

  def destroy
    
    @student.destroy
    redirect_to students_path, notice: "Elève supprimé"
  end

  def update
    @student.update(student_params)
    if @student.update(student_params)
      redirect_to students_path, notice: "Informations sur l'élève  modifiés !"
    else 
      render :edit  
    end
  end

  def edit
  end

  def confirm 
    @student = Student.new(student_params)
    render :new if @student.invalid?
  end
  
  private
  def student_params 
    params.require(:student).permit(:last_name, :first_name, :age)
  end
  
  def set_student 
    @student = Student.find(params[:id])
  end

end
