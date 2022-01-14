FROM nikolaik/python-nodejs:python3.9-nodejs16
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir solidmusic \
    && cd solidmusic \
    && git clone https://github.com/DoellBarr/solidmusic
WORKDIR /solidmusic/solidmusic
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt
CMD ["python3", "main.py"]