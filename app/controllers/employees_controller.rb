class EmployeesController < ApplicationController
    def index
        @employee = Employee.all
    end

    def show 
        @employee = Employee.find(params[:id])
    end

    def new 
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params(:first_name, :last_name, :alias, :title, :office, :dog_id))
        @employee.save
        redirect_to employee_path(@employee)
    end


    def edit
        @employee = Employee.find(params[:id])
    end


    private

    def employee_params(*args)
        params.require(:employee).permit(*args)
    end

end
