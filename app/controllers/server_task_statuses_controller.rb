class ServerTaskStatusesController < ApplicationController

  def index
    @server = Server.find(params[:server_id])
    @task = Task.find(params[:task_id])
    @server_task_statuses = ServerTaskStatus.where('server_id' => @server.id, 'task_id' => @task.id).order("created_at desc").all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @server_task_statuses }
    end
  end

  def show
    @server = Server.find(params[:server_id])
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  def new
    @server = Server.find(params[:server_id])
    @task = Task.find(params[:task_id])
    @server_task_status = ServerTaskStatus.new(:server_id => @server.id, :task_id => @task.id)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @server_task_status }
    end
  end

  def edit
    @server = Server.find(params[:id])
  end

  def create
    @server = Server.find(params[:server_id])
    @task = Task.find(params[:task_id])
    params[:server_task_status][:server_id] = @server.id;
    params[:server_task_status][:task_id] = @task.id;
    @server_task_status = ServerTaskStatus.new(params[:server_task_status])
    respond_to do |format|
      if @server_task_status.save
        format.html { redirect_to(server_task_server_task_statuses_path(@server, @task)) }
        format.xml  { render :xml => @server_task_status, :status => :created, :location => @server_task_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @server_task_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @server = Server.find(params[:id])

    respond_to do |format|
      if @server.update_attributes(params[:server])
        format.html { redirect_to(@server, :notice => 'Server was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @server.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @server = Server.find(params[:id])
    @server.destroy

    respond_to do |format|
      format.html { redirect_to(servers_url) }
      format.xml  { head :ok }
    end
  end
end
