# Commit generator

Tired of creating a lot of commits to make your github profile look cool? This script will generate as many commits as you want in the number of days that you assign. This script will also create random messages for your commits.

## Getting Started

Run the following npm command to install

```
npm i comgen
```

URL: https://www.npmjs.com/package/comgen
<br/>
<br/>
OR
<br/>
<br/>
1.Fork this repo https://github.com/pevargasg/auto-commitGenerator
<br/>
2.Clone the forked repo into your local environment
<br/>
3.Run npm install
<br/>
4.Open the commit-generator.sh file under your node_modules/comgen
<br/>
5.Modify the variables

```
days = represent the number of days, the number of commits will be assigned
hours = represent the number of hours, the number of commits will be assigned
minutes = represent the number of minutes, the number of commits will be assigned
totalNumberOfCommits = number of commits
```

### NPM Run

In you package.json you can add the following line under scripts:

```
"scripts": {
    "comgen": "sh node_modules/comgen/commit-generator.sh"
 }
```

This will run the the shell file by doing <strong>npm run comgen</strong>

### Examples of Usage

<strong>npm run comgen d 365 h 24 m 60 c 100</strong>
<br/>
<strong>npm run comgen</strong>
<br/>
<strong>npm run comgen days 365 hours 24 minutes 60 commits 100</strong>
<br/>
Note that the deafault values are days :365, hours: 24, minutes: 60 and total commits: 300

```
d: days
h: hours
m: minutes
c: number of commits
```

### Shell Script

```
days=3
hours=24
minutes=60
totalNumberOfCommits=3

while [ $# -ne 0 ]; do
  case "$1" in
    "-d") days=$2; shift 2;;
    "-tc") totalNumberOfCommits=$2; shift 2;;
    *) break;;
  esac
done

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

- **Patricio Vargas** - _Initial work_

See also the list of [contributors](https://github.com/pevargasg/auto-commitGenerator/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [https://github.com/pevargasg/auto-commitGenerator/blob/master/LICENSE](LICENSE.md) file for details

```

```
