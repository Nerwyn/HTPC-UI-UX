'''
Simple script to generate versions of app images with transparent borders
Increase percentLarge in main() to increase zoom
Recommended original image size is 1240x600 (based on Window Store App full size rectangle icon), but other sizes should work
'''
from PIL import Image
import os


def main():
	percentLarger = 1.2

	# Get all non Borders images in skin
	for root, _dirs, files in os.walk('..'):
		for f in files:
			if '.png' in f and 'Borders' not in f:
				# Load original image file as numpy array
				img0 = Image.open(root + '\\' + f)

				# Add transparent border to original image
				width0, height0 = img0.size
				width1 = int(percentLarger * width0)
				height1 = int(percentLarger * height0)
				img1 = Image.new('RGBA', (width1, height1), (0, 0, 0, 0))
				x = (width1 - width0) // 2
				y = (height1 - height0) // 2
				img1.paste(img0, (x, y))
				img1.save(root + '\\' + f[0:f.rfind('.')] + 'Borders.png')


if __name__ == '__main__':
	main()