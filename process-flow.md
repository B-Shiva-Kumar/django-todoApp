# process-flow.md

* *This is a rough readme file for my reference, organized with respect to the process flow to make it available for others to use.*
* *Thanks to Shreys (source code) and Shubam (deployment flow) for making this a open-source project.*


### python installation and set env-variables (initial steps - onetime):

- *download and install latest python from the official doc.*
- *ADD env variables replicates the same as below (use your local python path) and ensure to add `Scripts` folder as well along with the regular python path to avoid error*

```
# add to (PATH) -> env variables (windows search and open by default advanced) -> select PATH (of system variables) -> EDIT -> ADD and SAVE.



"C:\Users\USERNAME\AppData\Local\Programs\Python\Python312\"
"C:\Users\USERNAME\AppData\Local\Programs\Python\Python312\Scripts" to user and system env variables.
```

---
## python venv
*Use Virtual env when using PYTHON in Windows OS as a best practise*

```
# install venv (if not already installed)

pip install virtualenv        # install virtualenv package using pip
virtualenv -p python3.12 env  # create virtualenv with folder name env
```

*to activate/deactivate virtual env for Windows/VScode:*

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser # onetime run

.\env\Scripts\activate.ps1                                           # to activate 

deactivate                                                           # to deactivate
```

```
# routine steps :)

git clone
cd project_name
pip install django  # if not already installed

# to create requirements.txt file (if not available in the repo and when source code works fine)
pip freeze > requirements.txt
```

---
### Dockerfile for django:

```
# python base image 
FROM python:3-slim

# install django
RUN pip install django==3.2

# copy source dest
COPY . . 

RUN python manage.py migrate

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
```

```
*good to know*

http://127.0.0.1:8000/ # local host
http://0.0.0.0:8000/   # Server host to access anywhere (OR use server IP)
```
---

### Docker commands:
```
docker build . -t todo-app
docker run -p 8000:8000 <cid>

docker run -d -p 8000:8000 <cid> # -d for running container in background (deamon)
docker stop <cid> 
docker kill <cid>
docker rm <cid>
```
___________________________________________________________________________________________________
### UBUNTU commands:

To run python runserver terminal in the background (ubuntu OS)
```
nohup mython3 manage.py runserver 0.0.0.0:8000&
```

To stop the APP running in the background terminal:

```
lsof -i:8000                            # :<use any port>
kill -9 <process-id>                    # -9 is process
```


## Jenkins Docker-image:

Jenkins can be used without any manual instructions in a single click using Jenkins Docker image:
```
docker pull jenkins/jenkins
```

## Jenkins ERROR and Troubleshoot:

**ERROR: can't cd to /home/ubuntu/project_name**
``` 
chmod 777 ubuntu/     # give 777 access to ubuntu folder 
```

**ERROR: sudo a terminal is required to read the pass .... use -S**


"sudo: a terminal is required to read the password; either use the -S option to read from standard input or configure an askpass helper
sudo: a password is required"


**To resolve the error → on terminal:**

``` 
sudo su

visudo -f /etc/sudoers

# add the line at the end
jenkins ALL = NOPASSWD: ALL

```
---


### *ref:*
*feel free to add random references*

- [project using similar tech stack](https://medium.com/@priyanka_kale/project-a8d164dbd5)
- [md decoratives](https://www.markdownguide.org/cheat-sheet/)

***