class QrcodesController < ApplicationController
  def new
  end

  def show
    qrcode_params = params[:content].to_s
    qrcode_file = Qrcode.new(qrcode_params)
    @qrcode = qrcode_file.generate_qrcode
    
    respond_to do |format|
      format.json { render :json => {qrcode: "#{root_url}#{qrcode_src}"}, status: :ok }
      format.html { render :show, notice: "Your QRCode was GRACEFFULY generated!" }
    end
    
    # cleaup this file after some seconds timeout

    # arrumar um jeito de enviar como api aqui

  end
end
