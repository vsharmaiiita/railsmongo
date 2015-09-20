require 'uuid'
class BirdsController < ApplicationController
	def create
    begin
      bparams = params[:bird]
      if check_post_param(bparams)
        bird = Bird.new(name: bparams[:name],
                        family: bparams[:family],
                        continents: bparams[:continents],
                        id: UUID.generate,
                        visible: get_visible(bparams[:visible]),
                        Time.now.strftime(""))
        saved = bird.save
      end
    rescue
    end
    if saved
      render json: bird, status: :created
    else
      render json: "", status: 400
    end
  end

  def index
    ret = []
    Bird.all.each do |bird|
      ret << bird.id
    end
    render json: ret, status: :ok
  end

  def show
    begin
      bird = Bird.find(params[:id])
    rescue
    end
    if bird.nil?
      render json: "", status: 404
    else
      render json: bird, status: :ok
    end
  end

  def destroy
    begin
      bird = Bird.find(params[:id])
    rescue
    end
    if bird.nil?
      render json: "", status: 404
    else
      bird.delete
      render json: "", status: :ok
    end
  end

  private

  def check_post_param(bird)
    if bird[:family].nil? or bird[:name].nil? or bird[:continents].nil?
      false
    else
      true
    end
  end

  def get_visible(value)
    if value.nil?
      false
    else
      value
    end
  end
end
