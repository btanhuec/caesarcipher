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

  def encode(cipher)
    @cipher = cipher
    str = cipher.body
    n = cipher.offset
    ascii = str.split("")
    t = ''
    ascii.each do |w|
      temp = calc(w,n)
      t = t + temp
    end
    cipher.body =  t
  end

  LOWER_CASE = ('a'.ord .. 'z'.ord)
  UPPER_CASE = ('A'.ord .. 'Z'.ord)
  def calc(c, by)
    alphabet = (("A".."Z").to_a + ("a".."z").to_a).join
    byte = c.ord
    if LOWER_CASE.include?(byte) then
        ((((byte - LOWER_CASE.min) + by) % 26) + LOWER_CASE.min).chr
    elsif UPPER_CASE.include?(byte) then
        ((((byte - UPPER_CASE.min) + by) % 26) + UPPER_CASE.min).chr
    else
        c
    end
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
