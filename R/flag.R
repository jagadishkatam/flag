library(ggplot2)
library(png)
library(patchwork)
library(grid)
library(here)

# Create the Indian flag using ggplot2
indian_flag <- ggplot() +
  geom_rect(aes(
    xmin = 0,
    xmax = 2,
    ymin = 0,
    ymax = 1
  ), fill = "#138808") +  # Green stripe
  geom_rect(aes(
    xmin = 0,
    xmax = 2,
    ymin = 1 / 3,
    ymax = 2 / 3
  ), fill = "#FFFFFF") +  # White stripe
  geom_rect(aes(
    xmin = 0,
    xmax = 2,
    ymin = 2 / 3,
    ymax = 1
  ), fill = "#FF9933") +  # Orange stripe
  theme_void() +
  ggtitle(label = "Happy Independence Day", subtitle = "2023") +
  labs(caption = "From: Jagadish Katam") +
  theme(
    plot.title = element_text(
      color = "blue",
      size = 20,
      face = "bold",
      hjust = 0.5
    ),
    plot.subtitle = element_text(
      color = "blue",
      size = 18,
      hjust = 0.5
    ),
    plot.caption = element_text(
      color = "red",
      size = 15,
      hjust = 0.5
    )
  )

# Load the PNG representation of the Ashoka Chakra
chakra_image_path <- here::here('img', 'Ashoka_Chakra.png')
chakra_image <- png::readPNG(chakra_image_path, native = TRUE)

# Position the Ashoka Chakra in the center of the flag
indian_flag_with_chakra <- indian_flag +
  annotation_raster(
    chakra_image, 
    xmin = 1.25,  # Position left side of Chakra
    xmax = 0.8,  # Position right side of Chakra
    ymin = 0.34,  # Position bottom of Chakra
    ymax = 0.66   # Position top of Chakra
  )

# Save the final image
ggsave(
  "indian_flag_with_chakra.png",
  device = 'png',
  plot = indian_flag_with_chakra,
  path = 'img/',
  width = 6,
  height = 4,
  units = "in",
  dpi = 500
)

# Display the final flag with Ashoka Chakra
indian_flag_with_chakra
