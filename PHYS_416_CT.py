import numpy as np
import matplotlib.pyplot as plt
import skimage
from PIL import Image

from skimage.transform import radon, rescale

image = Image.open("lena.jpg")
image = np.array(image)


fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(8, 4.5))

ax1.set_title("Original")
ax1.imshow(image, cmap=plt.cm.Greys_r)

#max(image.shape)

theta = np.linspace(0.0, 180.0, 512, endpoint=False)
projection = radon(image, theta=theta)
dx, dy = 0.5 * 180.0 / max(image.shape), 0.5 / projection.shape[0]
ax2.set_title("Projection")
ax2.set_xlabel("Projection angle (deg)")
ax2.set_ylabel("Projection position (pixels)")
ax2.imshow(
    projection,
    cmap=plt.cm.Greys_r,
    extent=(-dx, 180.0 + dx, -dy, projection.shape[0] + dy),
    aspect='auto',
)

fig.tight_layout()
plt.show()

from skimage.transform import iradon

#reconstruction 

reconstruction_fbp = iradon(projection, theta=theta, filter_name='cosine')

imkwargs = dict(vmin=-0.2, vmax=0.2)
fig, ax1 = plt.subplots(figsize=(8, 4.5))
ax1.set_title("Reconstruction\nFiltered back projection")
ax1.imshow(reconstruction_fbp, cmap=plt.cm.Greys_r)
plt.show()
