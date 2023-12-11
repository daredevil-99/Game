FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Install Python
ADD https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe C:/python-3.9.7-amd64.exe
RUN C:\python-3.9.7-amd64.exe /quiet InstallAllUsers=1 PrependPath=1
RUN DEL C:\python-3.9.7-amd64.exe
# Set the working directory
WORKDIR /Python_program

# Copy the application 

COPY . /application

# Upgrade pip
RUN pip install --upgrade pip

# Install requirements
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

# Set the entry point
CMD ["python", "application.py"]


