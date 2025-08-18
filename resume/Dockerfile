# Use the official TeX Live image as the base image
FROM texlive/texlive:latest

# Install latexmk and the desired font package
RUN tlmgr install latexmk merriweather

# Set the working directory
WORKDIR /workspace

# # Copy LaTeX files into the container
# COPY resume/ /workspace

# Create volumes for input, output, and assets
VOLUME ["/input", "/output", "/assets"]

# Compile the LaTeX document using latexmk
CMD ["latexmk", "-output-directory=/output/build", "-pdf", "-cd", "/input/TracyMiles_Resume.tex"]