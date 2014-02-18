class StatusesController < ApplicationController
  before_action :set_current_project
  before_action :set_status, only: [:show, :edit, :update, :destroy]
  

  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = @project.statuses.order('created_at DESC')
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
  end

  # GET /statuses/new
  def new
    @status = @project.statuses.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = @project.statuses.new(status_params)

    respond_to do |format|
      if @status.save
        format.html { redirect_to project_statuses_path, notice: 'Status was successfully created.' }
        format.json { render action: 'show', status: :created, location: @status }
      else
        format.html { render action: 'new' }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to project_status_path, notice: 'Status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status.destroy
    respond_to do |format|
      format.html { redirect_to project_statuses_url }
      format.json { head :no_content }
    end
  end

# Cette méthode évite de devoir utiliser les 2 paramètres (@project, status) à chaque fois qu'on veut faire un lien. 
# Ça ajoute automatiquement le project_id à l'URL.
  def url_options
    { project_id: params[:project_id] }.merge(super)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_project
      @project = Project.find(params[:project_id])
    end

    def set_status
      @status = @project.statuses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:content, :project_id, :image)
    end

end
