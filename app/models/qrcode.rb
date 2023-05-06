class Qrcode
    def initialize(url)
      @url = url
    end

    def generate_qrcode
      qrcode = RQRCode::QRCode.new(@url)

      qrcode_img = qrcode.as_png(
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
        file_name = "#{SecureRandom.hex(32)}.png"
        qrcode_src = "generated/#{file_name}"
        
        IO.binwrite("public/#{qrcode_src}", qrcode_img.to_s)
        
        qrcode_absolute = "/#{qrcode_src}"
    end
    
end