# Commit generator

Tired of creating a lot of commits to make your github profile look cool? This script will generate as many commits as you want in the number of days that you assign. This script will also create random messages for your commits.

## Getting Started

1.Fork this repo
<br/>
2.Clone the forked repo into your local environment
<br/>
3.Open the commit-generator.sh file
<br/>
4.Modify the variables

```
days = represent the number of days, the number of commits will be assigned
hours = represent the number of hours, the number of commits will be assigned
minutes = represent the number of minutes, the number of commits will be assigned
totalNumberOfCommits = number of commits
```
### Shell Script

```
days=365
hours=24
minutes=60
totalNumberOfCommits=300
lenghtOfTime=$((days*hours*minutes))
lenghtOfTime=$((days*hours*minutes))
arrayOfCommits=$(shuf -i 1-$lenghtOfTime -n $totalNumberOfCommits | sort -r -n)

for index in $arrayOfCommits
  do
    randomMessage=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)  
    git commit --allow-empty --date "$(date -d "-$index minutes")" -m "$randomMessage"
  done 
git push origin master
```

## Contributing

Contact me wearetamo@gmail.com to make any contribution to this repo

## Authors

* **Patricio Vargas** - *Initial work*

See also the list of [contributors](https://github.com/pevargasg/auto-commitGenerator/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

