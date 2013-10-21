module Admin
  class TestsController < Admin::ApplicationController
    before_action :set_test, only: [:edit, :update, :destroy]

    # GET /admin/problems/1/tests/1/edit
    def edit
      @problem = @test.problem
    end

    # POST /admin/problems/1/tests
    # POST /admin/problems/1/tests.json
    def create
      @test = Test.new(test_params)

      respond_to do |format|
        if @test.save
          format.html { redirect_to admin_problem_path(@test.problem), notice: 'Test was successfully created.' }
          format.json { render action: 'show', status: :created, location: @test }
        else
          format.html { render action: 'new' }
          format.json { render json: @test.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/problems/1/tests/1
    # PATCH/PUT /admin/problems/1/tests/1.json
    def update
      respond_to do |format|
        if @test.update(test_params)
          format.html { redirect_to admin_problem_path(@test.problem), notice: 'Test was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @test.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/problems/1/tests/1
    # DELETE /admin/problems/1/tests/1.json
    def destroy
      @problem = @test.problem
      @test.destroy
      respond_to do |format|
        format.html { redirect_to admin_problem_path(@problem) }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:problem_id, :name, :input, :output)
    end
  end
end
