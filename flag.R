library(ggplot2)
library(png)
library(patchwork)

# Create the Indian flag using ggplot2
indian_flag <- ggplot() +
  geom_rect(aes(xmin = 0, xmax = 2, ymin = 0, ymax = 1), fill = "#138808") +
  geom_rect(aes(xmin = 0, xmax = 2, ymin = 1/3, ymax = 2/3), fill = "#FFFFFF") +
  geom_rect(aes(xmin = 0, xmax = 2, ymin = 2/3, ymax = 1), fill = "#FF9933") +
  theme_void() +
  ggtitle(label = 'Happy Independence Day', subtitle = '2023') +
  labs(caption = "From: Jagadish Katam") +
  theme(
    plot.title = element_text(color = "blue", size = 20, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(color = "blue", size = 18, hjust = 0.5),
    plot.caption = element_text(color = "red", size = 15, hjust = 0.5)
  )
  

# Load the PNG representation of the Ashoka Chakra 
chakra_image_path <- "C:\\Users\\jagad\\OneDrive\\Pictures\\Ashoka_Chakra.png"
chakra_grob <- png::readPNG(chakra_image_path, native = TRUE)

# Calculate image dimensions for scaling
chakra_width <- dim(chakra_grob)[2] / 425  # Assuming 300 dpi
chakra_height <- dim(chakra_grob)[1] / 425

# Annotate the Chakra grob onto the plot
indian_flag_with_chakra <- indian_flag +
  patchwork::inset_element(p = chakra_grob,
                           left = 0.5 - chakra_width / 2,
                           right = 0.5 + chakra_width / 2,
                           bottom = 0.5 - chakra_height / 2,
                           top = 0.5 + chakra_height / 2)

ggsave("indian_flag_with_chakra.png", plot = indian_flag_with_chakra, width = 6, height = 4, units = "in", dpi = 500)

print(indian_flag_with_chakra)
