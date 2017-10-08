class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    @todos = Todo.all?
    json_resoponse(@todos)
  end

  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  def show
    json_response(@todo)
  end

  def update
    @todo.update(todo_params)
    head :no_content
  end

  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    @todo = Todo.find(params[:id])
  end
  
end
