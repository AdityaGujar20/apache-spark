FROM apache/spark:4.0.1

USER root

# Install Python libraries
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# PostgreSQL JDBC Driver
ADD https://jdbc.postgresql.org/download/postgresql-42.7.1.jar /opt/spark/jars/

# Create useful directories
RUN mkdir -p /opt/spark/jobs \
    && mkdir -p /opt/spark/data \
    && mkdir -p /opt/spark/warehouse

USER spark