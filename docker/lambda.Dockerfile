FROM public.ecr.aws/lambda/python:3.11-arm64 as base

FROM base as build-env
COPY pyproject.toml /build-env/
COPY poetry.lock /build-env/

WORKDIR /build-env/
RUN pip install poetry \
 && poetry self add poetry-plugin-export \
 && poetry export --without-hashes --without dev --output requirements.txt

FROM base as runner

COPY --from=build-env /build-env/requirements.txt ${LAMBDA_TASK_ROOT}

RUN yum clean all && \
    yum install -y amazon-linux-extras && \
    PYTHON=python2 amazon-linux-extras install postgresql10&& \
    yum install -y gcc postgresql postgresql-devel && \
    pip install --upgrade pip && \
    mkdir NewBotoVersion && pip3 install -r requirements.txt -t .

COPY . ${LAMBDA_TASK_ROOT}
