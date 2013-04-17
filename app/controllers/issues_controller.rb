class IssuesController < ApplicationController
  # GET /issues
  # GET /issues.json
  def index
    login_required
    @issues = @user.projects.map{|x| x.issues }.flatten.select{ |i|
       i.status == 'open' or i.status.nil? or i.status.empty? } 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @issues }
    end
  end

  def retesting
    login_required
    @issues = @user.projects.map{|x| x.issues }.flatten.select{ |i|
       i.status == 'retesting' }
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @issues }
    end
  end

 
  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = Issue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/new
  # GET /issues/new.json
  def new
    @issue = Issue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
  end

  # POST /issues
  # POST /issues.json

  def create
    @project = Project.find(params[:project][:id])
    
    @issue = Issue.new(params[:issue])  
    
    @issue.attachments <<  Attachment.new(:name => params[:attachment]["file"].original_filename, :filename => params[:attachment]["file"].original_filename) 
    FileUtils.mv(params[:attachment]["file"].tempfile,  File.join("files", params[:attachment][:file].original_filename) )
    @project.issues << @issue 
    #@project = Project.find(params[:issue][:project])
    respond_to do |format|
      if @issue.save #project << @issue
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render json: @issue, status: :created, location: @issue }
      else
        format.html { render action: "new" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /issues/1
  # PUT /issues/1.json
  def update
    @issue = Issue.find(params[:id])

    respond_to do |format|
      if @issue.update_attributes(params[:issue])
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end
end
