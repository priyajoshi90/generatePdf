class ProductPdf < Prawn::Document
	def initialize(product)
		super(top_margin: 70)
		@product=product
		product_id
		product_name
	end

	def product_id
		text "Product\##{@product.id}"

	end

	def product_name
		move_down 20
		image open("#{Rails.root+@product.photo.path}")
		table product_name_rows
	end

	def product_name_rows

		[["Product","Qty","Price"]] + 
			[[@product.name, @product.qty, @product.price]]
	end

end