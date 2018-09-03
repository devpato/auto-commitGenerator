days=365
hours=24
minutes=60
totalNumberOfCommits=300
lenghtOfTime=$((days*hours*minutes))
arrayOfCommits=$(shuf -i 1-$lenghtOfTime -n $totalNumberOfCommits | sort -r -n)

for index in $arrayOfCommits
  do
    randomMessage=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)  
    git commit --allow-empty --date "$(date -d "-$index minutes")" -m "$randomMessage"
  done 
git push origin master
