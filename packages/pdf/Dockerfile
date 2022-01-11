FROM ubuntu:bionic

# Latex packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends texlive-latex-base texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /cv

COPY . /cv

# Default command
CMD ["pdflatex", "./cv.tex"]