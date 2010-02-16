class ProposalsController < ApplicationController
  before_filter :load_proposals
  before_filter :load_proposal, :only => [:show, :edit, :update, :destroy]
  before_filter :load_new_proposal, :only => [:new, :create]

  protected
  def load_proposals
    @proposals = Proposals.all
  end

  def load_proposal
    @proposal = Proposal.find(params[:id])
  end

  def load_new_proposal
    @proposal = Proposal.new(params[:proposal])
  end

  public
  def index
  end

  def new
  end

  def create
    if @proposal.save
      flash[:notice] = "Proposal created successfully."
      redirect_to @proposal
    else
      flash.now[:error] = "There was a problem creating the proposal."
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @proposal.update_attributes(params[:proposal])
      flash[:notice] = "The proposal was successfully edited."
      redirect_to :action => 'show', :id => @proposal
    else
      flash.now[:notice] = "There was a problem updating the proposal."
      render :action => 'edit'
    end
  end

  def destroy
    if @proposal.destroy
      flash[:notice] = "The proposal was deleted."
      redirect_to proposals_path
    else
      flash.now[:error] = "There was a problem deleting the proposal."
      render :action => 'show'
    end
  end

  def show
  end
end
