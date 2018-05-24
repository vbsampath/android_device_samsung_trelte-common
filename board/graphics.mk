# Graphics
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Virtual Display
BOARD_USES_VIRTUAL_DISPLAY := true

# Using the BGRA byteorder over the standard RGBA one
# apparently yields a performance increase of approx.
# 5% on some GPU hardware (including Mali)
BOARD_USE_BGRA_8888 := true
