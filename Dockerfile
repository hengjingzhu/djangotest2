FROM python:3.6

# Set build-time environment variable
ARG DJANGO_SECRET_KEY

# Set environment variables
ENV DJANGO_SECRET_KEY $DJANGO_SECRET_KEY


ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1



LABEL version ="0.1"
LABEL maintainer="David zhu"
# 创建一个项目文件
RUN mkdir /djangotest
# 创建一个 static 静态文件夹，用来存放 python manage.py collectstatic 的目录
RUN mkdir /djangostatic
# 把当前路径下的 django项目 文件夹(比如myobject1)的内容 拷贝到容器 /djangotest 文件夹下
# 注意如果是文件夹的话，这里的必须是相对路径
COPY . /djangotest

# 进入到容器内工作目录就是 /anglissData
WORKDIR /djangotest

# 安装 requirements.txt 模块
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
