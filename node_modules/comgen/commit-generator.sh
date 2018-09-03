days=365
hours=24
minutes=60
commits=300

while [ $# -ne 0 ]; do
  case "$1" in
    "d"|"days") days=$2; shift 2;;
    "h"|"hours") hours=$2; shift 2;;
    "m"|"minutes") minutes=$2; shift 2;;
    "c"|"commits") commits=$2; shift 2;;
    *) break;;
  esac
done

lenghtOfTime=$((days*hours*minutes))
arrayOfCommits=$(shuf -i 1-$lenghtOfTime -n $commits | sort -r -n)

echo "Days: $days"
echo "Hours: $hours"
echo "Minutes: $minutes"
echo "Commits: $commits"

for index in $arrayOfCommits
  do
    randomMessage=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    git commit --allow-empty --date "$(date -d "-$index minutes")" -m "$randomMessage"
  done
git push origin master