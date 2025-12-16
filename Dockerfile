# Minimal Docker image for GRU4Rec's official TensorFlow implementation using TensorFlow GPU base
FROM tensorflow/tensorflow:latest-gpu
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install GRU4Rec's official TensorFlow implementation
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y git && \
    pip install --no-cache-dir --upgrade joblib optuna pandas pexpect pip && \
    git clone https://github.com/hidasib/GRU4Rec_Tensorflow_Official.git && \
    mv GRU4Rec_Tensorflow_Official /usr/local/bin/GRU4Rec_Tensorflow_Official && \
    echo "alias gru4rec_run='python /usr/local/bin/GRU4Rec_Tensorflow_Official/run.py'" >> ~/.bashrc && \
    echo "alias gru4rec_paropt='python /usr/local/bin/GRU4Rec_Tensorflow_Official/paropt.py'" >> ~/.bashrc && \
    echo "alias gru4rec_tf='python /usr/local/bin/GRU4Rec_Tensorflow_Official/gru4rec_tf.py'" >> ~/.bashrc && \
    rm -rf /root/.cache /tmp/*
