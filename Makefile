venv: venv/bin/activate

venv/bin/activate: requirements.txt
	virtualenv -p python3 venv
	. venv/bin/activate && pip install -Ur requirements.txt

clean:
	rm -rf venv
	find . -iname "*.egg-info" -type d -exec rm -rf {} +
	find . -iname "*.pyc" -delete

deploy: users_prod.json
	scp $^ tal42@linux.cl.ds.cam.ac.uk:~/HallBot/users.json
