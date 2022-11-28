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
    random_code = SecureRandom.hex(8)
    @qrcode_src = "/generated/github-qrcode#{random_code}.png"
    IO.binwrite("public#{@qrcode_src}", png.to_s)
    
    respond_to do |format|
      format.html { render :show, notice: "Your QRCode was GRACEFFULY generated!" }
      format.json { render @qrcode_src, status: :ok }
    end
    
    # cleaup this file after some seconds timeout

    # arrumar um jeito de enviar como api aqui

  end
end
