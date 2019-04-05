import imageio
import glob

filenames = glob.glob('/Users/stevenban/Documents/Processing/single_lantern/output/*.png')
filenames.sort()
with imageio.get_writer('/Users/stevenban/Documents/Processing/single_lantern/output/lantern.gif', mode='I', fps =20) as writer:
    for filename in filenames:
        image = imageio.imread(filename)
        writer.append_data(image)