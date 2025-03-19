# 1️⃣ Use the correct base image
FROM python:3.9

# 2️⃣ Set the working directory inside the container
WORKDIR /app

# 3️⃣ Copy the application code into the container
COPY . /app

# 4️⃣ Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5️⃣ Expose the correct port (Flask default is 5000)
EXPOSE 5000

# 6️⃣ Set environment variables for Flask
ENV FLASK_APP=app/__init__.py
ENV FLASK_RUN_HOST=0.0.0.0

# 7️⃣ Set the correct entry point to run the application
CMD ["flask", "run"]
