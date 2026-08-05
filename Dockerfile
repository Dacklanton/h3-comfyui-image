FROM pytorch/pytorch:latest

RUN git clone https://github.com/comfyanonymous/ComfyUI.git /root/ComfyUI \
    && cd /root/ComfyUI \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir -U torch torchvision torchaudio

RUN mkdir -p /root/ComfyUI/models/diffusion_models \
             /root/ComfyUI/models/vae \
             /root/ComfyUI/models/text_encoders \
    && apt-get update -qq \
    && apt-get install -y -qq unzip \
    && rm -rf /var/lib/apt/lists/* \
    && curl -s https://rclone.org/install.sh | bash

WORKDIR /root/ComfyUI
