#Creates python dev envrionment within the current directory
alias createpyenv='python3 -m venv env'

# Removes python dev environment in the current directory
alias rmpyenv='rm -rf env'

# Starts python dev environment using the current directory's 'env/'
alias pyenv='source ./env/bin/activate'

# Starts Python3 http server at port 8000
alias pyserver3='python3 -m http.server 8000'

# Lists out opened port 8000's info.
# Kind of useless now since port_info_at function below works.
# alias port8000info='lsof -i :8000'

# List out specified port's info.
port_info_at() {
	lsof -i :"$1"
}

# AWS EC2 Instance Login
alias eecs485_aws_ec2_start='ssh -i 485_aws_key.pem ubuntu@ec2-18-216-99-41.us-east-2.compute.amazonaws.com'

# My own key
alias eecs485_steve='ssh -i steves_key.pem ubuntu@ec2-3-19-244-184.us-east-2.compute.amazonaws.com'

# Killing port 8000 processes that don't end.
alias nukeport8000='sudo fuser -k -n tcp 8000'
 
# Killing port 8888 and 50051 processes for Mynerva.
alias mynerva_nuke_servers='kill $(lsof -t -i:50051); kill $(lsof -t -i:8888)'

# Building source code for Mynerva.
alias mynerva_build_source_code='kill $(lsof -t -i:50051); cd /Users/stevelee/Desktop/School/UMich/Career/Raj/Mynerva/kernelbuildersvc; pyenv; bash /Users/stevelee/Desktop/School/UMich/Career/Raj/Mynerva/protobuf/bin/build; mynerva-kernelbuildersvc &'

# Build dev env for Mynerva project. This includesd rebuilding protobuf.
alias mynerva_build_env='mynerva_nuke_servers; cd /Users/stevelee/Desktop/School/UMich/Career/Raj/Mynerva/kernelbuildersvc; pyenv; mynerva_build_source_code pip install ../protobuf/python; pip install -e .; cd ..; jupyter notebook & jobs -l'

# Purging Docker Containers, Volumes, and Images - this takes a bit to complete.
alias docker_nuke_containers_and_vols='docker rm -vf $(docker ps -a -q)'
alias docker_nuke_images='docker rmi -f $(docker images -a -q)'

# Command needed for init-ing rbenv.
eval "$(rbenv init -)"

# Jekyll Dev Env and Server Setup.
alias jekyll_devenv_start='bundle exec jekyll build --watch & bundle exec jekyll serve'

# Jekyll Website Deploy Automation.
alias jekyll_convert_deploy_hyde='shopt -s extglob; cd hyde/Plain-Questions-Server; rm -rf -- !"(CNAME)"; cd ../../; cd jekyll/galada/; bundle exec jekyll build; cp -a _site/. ../../hyde/Plain-Questions-Server/; cd ../../hyde/Plain-Questions-Server/; git add -A; git commit -m "New Post Added Automatically."; git push; cd ../../'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stevelee/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/stevelee/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stevelee/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/stevelee/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# testing env var.
export SERVICE_ACCOUNT_JSON_B64="test"

# Google Container Registry Credential.
export SERVICE_ACCOUNT_JSON_B64="ewogICJ0eXBlIjogInNlcnZpY2VfYWNjb3VudCIsCiAgInByb2plY3RfaWQiOiAibXluZXJ2YS1kZXYtMjQ3MzAzIiwKICAicHJpdmF0ZV9rZXlfaWQiOiAiM2I3M2NmNWIxZjhlNzMxNDg4ZTM5YjIyNTNmODhhOTY4OGJjMzQzMSIsCiAgInByaXZhdGVfa2V5IjogIi0tLS0tQkVHSU4gUFJJVkFURSBLRVktLS0tLVxuTUlJRXZRSUJBREFOQmdrcWhraUc5dzBCQVFFRkFBU0NCS2N3Z2dTakFnRUFBb0lCQVFETStWWjNyT3d5aVI2MlxublVhSld6ckJiVm81NXJvNXpxSi9xYmdFZDlqbmVzbDJ3cFpOQmVXemU0RjJ4ZUh4OUZ0Q1d6cGFtRjY3UXRKUVxuSm9SQk8xMjFabklRcFk2M2hRUHpleHdySUpzT25ucjZ4bC9YRHFvQVpRUXEvQXo0VDJHNFlHZ1RWNmdPbm9YYVxud3FMZ3RsZ0c4R21qVlk2SDJ4MjVWajN5YjE3Q1BkbUp0bW1wcTZObjZMY3RUcGRLSFErcytFZC9TVER4ZS82QlxuVllkTGVEd0ZrWDNMVWVQeUpxNUNzbEE3MERQUGxBT09pWEpSQTVQdE1sVjE1eTkxUWU3dTNqR0ROeVdyN2dpZFxuQVRzTmMvN1BEaStNekJhSG01WUZKNWIwZm9IT0Q2Zm5rTEl0ZU4yV0N3SDI5cWVwenJDWXRHaW5FUUgzQmxIYVxuaFV2bkFlVmhBZ01CQUFFQ2dnRUFBdE90bnJONU81UlF1cmRVSVMzamcxWllseTNHaDhpQTNRaU9Wcnl2eG9lK1xuNUgwQUYxaHBjY3gyU1dqbXpneExCOGtIL3NiTkgrbFd5dU5nbWFFVjBJd2MzcXdYV2dKbkJzUWw3Qlg0VUhzVVxuM20xMjVmbU1OSHFnTEU3M0IzUEtFT0crdnJWTHpuV1BDbGlLeURWSWxSSXF6VTEzVEhvc0RJM0hCMzlqNWRNdlxuNVkwcnRLbXFKbjh2R2h2a21xcWRaVnVOR1h6Z1ZGVWFVV2NYYkd1bEk4RFRYQjFVQ2dab2l2TWQ3bk1YM0d1U1xuYjdha3NLNGxzMHhQZm9tRGdYQklzODJsZEo1bnF3dzNRSEpDcnBnNDc3ODYzSS9EamtBTXQyOWM4c2FEbmpGYVxuUjJmMzNRcXVjc0thcU5SMWxDT3pJKzlhbVNxREpqZHduenIxVmlIS1FRS0JnUUQyU0VBaEFDSko2VWlaSlg2MVxuS1VJdUhSTUFOK1ZoODBxbG1XVjdHRE1jQXV1N1R4SEQyaG9GanJTYlpqelZRa0dRdjAzTWJNQ3FGdGQ0YUg1TFxuMmNPelVmUjZGMksrOFpYWUlZTy96SGRuNC9SMDROTi9LS1N0ZzVtZU9peWk2Rjk1bFIyLzk5TzExQWNjcFJLdlxuejg1UEFnUFhIUmw1enRmQVd5anh4R0F6b1FLQmdRRFZEOUxod3kzdmRRWlJ3d1hYVkxSZy83NTh4Y3lSbGtHRlxuRnMyanZJRWdrZmxoR3R5ZlJjTXhoeXNNZkVkbXArVHdib255Q3hNL3JFWVdPckxQWXlkUGg1dGtCYUZhL3ZTZ1xuaitFdDNaYm9oQytmWVlaQlVSTG5vQk8rbTVUdUg5dG1aQ2JvNVRobFhuOFhHN1MyS0VwSGdyU2hiZ2wybnI1V1xuaVZTMEc0aFp3UUtCZ0JEbU9raEpheERwU2dzQU1LYWJzeWZZNU9IaDlBSjVvRWltc3ZqMFd5Vno2ZHNMZk91VVxuZnE2YzhUV3NtVVlFNnR6VTA3RFFVWlFhUnlUQy9zK1RuTU1rUDROVk1YaHF1VjZBUmpzVis2ZU1VOHpsVkgzb1xuT3d5UStDeU1UMTNLVmlyUW1aNy9rVzVyb3lWTENuSTM3eThxc3pyQ2kybjVVSUtwZnJEQVNkMmhBb0dBZmJBQlxuQWtlR29KMFRaa1k2K3VVd0o0eVd6YnBOekpDc0JCd0lvWS9CU1Bwejk3SEY5bnRNQTdxdVRZWS9CTE1FbmtWSFxuUVM4Qll1MTR4d0pIbTRudGxiLzBqaE80TlJyMEtvZldHWjEvdVpqSkV5ZVA4SllvSmRYTDhBU04zYytUT1JyWlxuelVmemRmRkIzZHJ0Und3TGpaWHdnczZMN0pzR3c3dnQ2UFhaQU1FQ2dZRUE3RXpsYmprN2pIdXdTTXV0RFNJaVxuQmw1WGo2UVIrZlVieVZacjdRTlJ1YWo1K3d6RHJXT0d5ZlN3M2ZBajZvazZ5TDhXa0tpWENvSHhuSTJvR09CRlxuWXdIQWJaanZUK2lEU2FiN0ZmenAvRUNwZVN6NjZvSWNtcHl6NjhpMTJIVFArMGxDYWZoRmFXbXdmME9EeWl5eVxuMFBzVDVha3hWUVllOVN6dEZJdEd3dFU9XG4tLS0tLUVORCBQUklWQVRFIEtFWS0tLS0tXG4iLAogICJjbGllbnRfZW1haWwiOiAia2VybmVsLWJ1aWxkZXItc2FAbXluZXJ2YS1kZXYtMjQ3MzAzLmlhbS5nc2VydmljZWFjY291bnQuY29tIiwKICAiY2xpZW50X2lkIjogIjExMzg0MTk1NTEzNTQyNDA1MzQxOCIsCiAgImF1dGhfdXJpIjogImh0dHBzOi8vYWNjb3VudHMuZ29vZ2xlLmNvbS9vL29hdXRoMi9hdXRoIiwKICAidG9rZW5fdXJpIjogImh0dHBzOi8vb2F1dGgyLmdvb2dsZWFwaXMuY29tL3Rva2VuIiwKICAiYXV0aF9wcm92aWRlcl94NTA5X2NlcnRfdXJsIjogImh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL29hdXRoMi92MS9jZXJ0cyIsCiAgImNsaWVudF94NTA5X2NlcnRfdXJsIjogImh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL3JvYm90L3YxL21ldGFkYXRhL3g1MDkva2VybmVsLWJ1aWxkZXItc2ElNDBteW5lcnZhLWRldi0yNDczMDMuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iCn0K"


alias talktojosh='nc -n -v 35.1.234.101 10001'
alias listen_on_10001='nc -n -v -l 10001'
# added by Anaconda3 2019.10 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/stevelee/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/stevelee/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/stevelee/opt/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/stevelee/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

alias startcondaenv_p1='conda activate project1'
