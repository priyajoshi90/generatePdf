class ProductPdf < Prawn::Document
	def initialize(product)
		super(top_margin: 70)
		@product=product
		product_id
		product_name
	end

	def product_id
		text "Product\##{@product.id}", size:20, style: :bold

	end

	def product_name
		move_down 20
		image open("#{@product.photo.url}")
		#text "#{@product.photo.url}"
		#image product.photo.url
		#Rails.root + @product.photo.url
		table product_name_rows
	end

	def product_name_rows

		[["Product","Qty","Price","Photo"]] + 
			[[@product.name, @product.qty, @product.price, @product.photo.url]]
	end

	def show_sample
		id_sample = Rails.root + @pi.picture.url(:large)
		image id_sample, at: [0,900], height: 161, width: 250
		move_down 20
	end
end