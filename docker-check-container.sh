# Goal of tghis script is to prompt for Docker container name, if it's skipped it will used infile defined name of container and then will search for specific container and delete it.

# Set container default name as variable
CONTAINER=testContainerName

echo -n "Enter Docker container name (if skipped default from file will be used): "
read containerName

# Check if prompted value isNotEmpty
if [ $containerName ]; then
  CONTAINER=$containerName
fi

# Check if container exist and delete
if [ "$(docker ps -a | grep -c $CONTAINER)" -gt 0 ]; then

  echo -n "Do you wish to delete this container? y/n: "
  read answer

  if [ "$answer" != "${answer#[Yy]}" ]; then # this grammar (the #[] operator) means that the variable $answer where any Y or y in 1st position will be dropped if they exist.
    docker rm -f $CONTAINER
    echo "[---- Deleted container $CONTAINER]"
  else
    echo "Leaving script execution."
  fi

else
  echo "[---- Container with name: $CONTAINER  doesn't exist. ]"
fi

exit
