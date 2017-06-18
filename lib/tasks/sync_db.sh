keep_local='false'

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "Captures and downloads latest snapshot from heroku"
			echo ""
			echo "options:"
			echo "-h, --help                show brief help"
			echo "-k                        keeps dump in case you want to investigate more"
			echo "-c, --capture             tells heroku to create a snapshot"
			exit 0
      ;;
    -c|--capture)
      echo "Capturing snapshot"
      heroku pg:backups capture
      shift
      ;;
    -k)
      keep_local='true'
      shift
      ;;
    *)
      shift
      break
      ;;
  esac
done

echo "Downloading snapshot..."
curl -o latest.dump `heroku pg:backups public-url`

echo "Running pg_restore"
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d portfolio_development latest.dump

if [ "$keep_local" == "false" ]; then
  echo "Removing local copy"
  rm latest.dump
fi
