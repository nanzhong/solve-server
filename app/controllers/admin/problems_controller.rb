module Admin
  class ProblemsController < Admin::ApplicationController
    before_action :set_problem, only: [:show, :edit, :update, :destroy]

    # GET /admin/problems
    # GET /admin/problems.json
    def index
      @problems = Problem.all
    end

    # GET /admin/problems/1
    # GET /admin/problems/1.json
    def show
    end

    # GET /admin/problems/new
    def new
      @problem = Problem.new
    end

    # GET /admin/problems/1/edit
    def edit
    end

    # POST /admin/problems
    # POST /admin/problems.json
    def create
      @problem = Problem.new(problem_params)

      respond_to do |format|
        if @problem.save
          format.html { redirect_to admin_problem_path(@problem), notice: 'Problem was successfully created.' }
          format.json { render action: 'show', status: :created, location: @problem }
        else
          format.html { render action: 'new' }
          format.json { render json: @problem.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/problems/1
    # PATCH/PUT /admin/problems/1.json
    def update
      respond_to do |format|
        if @problem.update(problem_params)
          format.html { redirect_to admin_problem_path(@problem), notice: 'Problem was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @problem.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/problems/1
    # DELETE /admin/problems/1.json
    def destroy
      @problem.destroy
      respond_to do |format|
        format.html { redirect_to problems_url }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = Problem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_params
      params.require(:problem).permit(:name, :description)
    end
  end
end
