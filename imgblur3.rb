class Image
	def initialize(collection)
		@images = collection
	end
	def output_image
		@images.each {|image| puts image.join}
	end
	def blur(n)
		one_flag(@images).each {|a| pixel_change(a, n)}
		output_image
	end
# private helper methods
	private
	def one_flag(arr)
		row = 0
		one_loc = []
		arr.each do |a|
			a.each_with_index do |element, col|
				if element == 1		 
					one_loc << [row, col]
				end
		end
			row +=1
		end
		one_loc.each {|a| puts a.join} #uncomment to print the locations of all ones in a given array 
	end
	private
	def pixel_change(arr, n)
		arr_size =  @images.size
		#dealing with the corner case where the col is at the first index and row is at the last index 
		if arr[1] == 0 && arr[0] == arr_size - n
			@images[arr[0]-n][arr[1]] = 1
			@images[arr[0]][arr[1] + n] = 1
		#dealing with the second corner case scenario where the row is at the first index and col is at the last index
		elsif arr[0] == 0 && arr[1] == arr_size - n
			@images[arr[0]+n][arr[1]] = 1
			@images[arr[0]][arr[1] + n] = 1
		# dealing with the normal scenarios of 1s available in the middle rows and columns
		elsif arr[0] >=1 && arr[1] >=1
			@images[arr[0]][arr[1] - n] = 1
			@images[arr[0]][arr[1] + n] = 1
			@images[arr[0]-n][arr[1]] = 1
			@images[arr[0]+n][arr[1]] = 1
		# dealing with row being on the edge 
		elsif arr[0] == 0
			@images[arr[0]][arr[1] - n] = 1
			@images[arr[0]][arr[1] + n] = 1
			@images[arr[0]+n][arr[1]] = 1
		# dealing with col being on the edge
		elsif arr[1] == 0
			@images[arr[0]-n][arr[1]] = 1
			@images[arr[0]+n][arr[1]] = 1
			@images[arr[0]][arr[1] + n] = 1
	end
	end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0]
])
image.output_image
image.blur(1)

