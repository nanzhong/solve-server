class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show, :edit, :update, :destroy]

  # GET /problems/1/solutions
  # GET /problems/1/solutions.json
  def index
    @problem = Problem.find(params[:problem_id])
    @solutions = @problem.solutions.order('id DESC')
  end

  # GET /problems/1/solutions/1
  # GET /problems/1/solutions/1.json
  def show
  end

  # GET /problems/1/solutions/new
  def new
    @solution = Solution.new
  end

  # GET /problems/1/solutions/1/edit
  def edit
  end

  # POST /problems/1/solutions
  # POST /problems/1/solutions.json
  def create
    @language = Language.where(key: solution_params['language']).take
    if @language
      params[:solution][:language_id] = @language.id
      params[:solution].delete(:language)

      @problem = Problem.find(params.require(:problem_id))
      @user = User.where(api_key: params.require(:api_key)).take

      @solution = Solution.new(solution_params)
      @solution.user = @user
      @solution.problem = @problem
      @solution.language = @language

      respond_to do |format|
        if @solution.save
          TestWorker.perform_async(@solution.id)

          format.html { redirect_to @solution, notice: 'Solution was successfully created.' }
          format.json { render action: 'show', status: :created, location: [@solution.problem, @solution] }
        else
          format.html { render action: 'new' }
          format.json { render json: @solution.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        language_string = ''
        Language.all.each do |language|
          language_string += "#{language.key}\t#{language.name}\n"
        end

        format.json { render json: { error: "Unsupported language\nSupported languages:\n#{language_string}" }, status: 400 }
      end
    end
  end

  # PATCH/PUT /problems/1/solutions/1
  # PATCH/PUT /problems/1/solutions/1.json
  def update
    respond_to do |format|
      if @solution.update(solution_params)
        params[:solution][:test_runs].each do |test_run|
          @solution.test_runs.create(test_run)
        end

        format.html { redirect_to @solution, notice: 'Solution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1/solutions/1
  # DELETE /problems/1/solutions/1.json
  def destroy
    @solution.destroy
    respond_to do |format|
      format.html { redirect_to solutions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solution
      @solution = Solution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solution_params
      params.require(:solution).permit(:problem_id, :language, :code, :tested, :test_runs)
    end
end
