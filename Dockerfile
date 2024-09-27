FROM python:3.11-slim-bookworm

EXPOSE 8989

WORKDIR /app/zhenxun

COPY . /app/zhenxun

RUN apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends \
    gcc \
    g++ && \
    apt clean

RUN pip install poetry -i https://mirrors.aliyun.com/pypi/simple/

RUN poetry install

RUN poetry run playwright install --with-deps chromium

CMD ["poetry", "run", "python", "bot.py"]
