FROM python:3

RUN pip install flask

RUN pip install requests

EXPOSE 5000

COPY todolist.db .

COPY todolist.py .

COPY templates/index.html templates/

CMD python python todolist.py
