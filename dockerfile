FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Install Python
ADD https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe C:/python-3.9.7-amd64.exe
RUN C:\python-3.9.7-amd64.exe /quiet InstallAllUsers=1 PrependPath=1
RUN DEL C:\python-3.9.7-amd64.exe
# Set the working directory
WORKDIR /PYTHON_PROGRAM

# Copy the application 

COPY . /application

# Upgrade pip
RUN powershell -Command "python -m pip install --upgrade pip"

# Install requirements
RUN powershell -Command "python -m pip install -r requirements.txt"

# Set the entry point
CMD ["python", "application.py"]


