class QrcodeController < ApplicationController
  def new
  end

  def show
    qrcode = RQRCode::QRCode.new(params[:content].to_s)
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 300
    )
    png_name = "qrcode-#{SecureRandom.hex(8)}.png"
    qrcode_src = "generated/#{png_name}"
    @qrcode = "/#{qrcode_src}"

    IO.binwrite("public/#{qrcode_src}", png.to_s)
    
    respond_to do |format|
      format.json { render :json => {qrcode: "#{root_url}#{qrcode_src}"}, status: :ok }
      format.html { render :show, notice: "Your QRCode was GRACEFFULY generated!" }
    end
    
    # cleaup this file after some seconds timeout

    # arrumar um jeito de enviar como api aqui

  end
end
