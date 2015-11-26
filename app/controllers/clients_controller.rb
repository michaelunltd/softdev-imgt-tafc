 class ClientsController < ApplicationController
  def index
    if params[:search]
      @clients = Client.search(params[:search]).order('company_name ASC')
    else
      @clients = Client.all.order('company_name ASC')
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      flash[:notice] = 'Client successfully added.'
      redirect_to clients_path
    else
      render :new
    end

  end

  def edit
    @client = Client.find(params[:id])
  end

  def destroy
    @client = Client.find(params[:id])

    @client.destroy

    redirect_to clients_path
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(client_params)
      flash[:notice] = 'Client successfully updated.'
      redirect_to clients_path
    else
      render :edit
    end
  end


  private

  def client_params
    params.require(:client).permit(:company_name, :owner, :representative, :address, :tel_num, :email, :tin_num, :status, :user_id)
  end


end
