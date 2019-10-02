class CiphersController < ApplicationController
  before_action :set_cipher, only: [:show, :edit, :update, :destroy]

  # GET /ciphers
  # GET /ciphers.json
  def index
    @ciphers = Cipher.all
  end

  # GET /ciphers/1
  # GET /ciphers/1.json
  def show
  end

  # GET /ciphers/new
  def new
    @cipher = Cipher.new
  end

  # GET /ciphers/1/edit
  def edit
  end

  # POST /ciphers
  # POST /ciphers.json
  def create
    @cipher = Cipher.new(cipher_params)

    respond_to do |format|
      if @cipher.save

        format.html { redirect_to @cipher, notice: 'Cipher was successfully created.' }
        format.json { render :show, status: :created, location: @cipher }
      else
        format.html { render :new }
        format.json { render json: @cipher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ciphers/1
  # PATCH/PUT /ciphers/1.json
  def update
    respond_to do |format|
      if @cipher.update(cipher_params)
        format.html { redirect_to @cipher, notice: 'Cipher was successfully updated.' }
        format.json { render :show, status: :ok, location: @cipher }
      else
        format.html { render :edit }
        format.json { render json: @cipher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ciphers/1
  # DELETE /ciphers/1.json
  def destroy
    @cipher.destroy
    respond_to do |format|
      format.html { redirect_to ciphers_url, notice: 'Cipher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def encode(cipher,num)
    @cipher = cipher
    @num = Integer(num)
      str = cipher.body
      off = cipher.offset
      ascii = str.chars.map { |c| c.ord }
      shifted = ascii.map { |c| c + off}
      shifted2 = shifted.map {|c| c % num}

    cipher.body =  shifted.map { |c| c.chr }.join
  end
  helper_method :encode

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cipher
      @cipher = Cipher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cipher_params
      params.require(:cipher).permit(:offset, :body)
    end
end
