FROM tensorflow/tensorflow:1.15.0rc1-gpu-py3-jupyter

WORKDIR "/root"

# install protobuf 3
RUN curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip
RUN unzip protoc-3.2.0-linux-x86_64.zip -d protoc3
RUN mv protoc3/bin/* /usr/local/bin/
RUN mv protoc3/include/* /usr/local/include/

# install pycocotool for evaluation
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt install -y git python3-tk libsm6 libxext6
RUN pip3 install cython pillow opencv-python
RUN pip3 install git+https://github.com/philferriere/cocoapi.git#subdirectory=PythonAPI

RUN pip install numpy
RUN pip install pandas
RUN pip install matplotlib

RUN pip install -U scikit-image
RUN pip install keras==2.1.6
RUN pip3 install imgaug
RUN pip3 install -U scikit-learn
