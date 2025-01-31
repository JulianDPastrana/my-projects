# create_script: A function to quickly generate a new Bash script.
# Usage: create_script [script_name]
# - If a name is provided, it creates a script with that name.
# - If no extension is given, '.sh' is appended automatically.
# - If no name is provided, 'new_script.sh' is used as the default.
# - The script is made executable upon creation.


function create_script() {
  # Declare 'script_name' and assign it the first argument passed to the function
  local script_name="$1"

  # If no name is provided, assign a default name
  if [[ -z "$script_name" ]]; then
    echo "-- Warning: No name provided. Using default 'new_script.sh'."
    script_name="new_script.sh"
  fi

  # Ensure the script has an extension
  if [[ "$script_name" != *.* ]]; then
    echo "-- Warning: No extension provided. '.sh' will be appended."
    script_name="${script_name}.sh"
  fi

  # Create the script file with a default template
  cat <<EOF > "$script_name"
#!/usr/bin/env bash

# Write your script here ...

EOF

  # Make the script executable
  chmod u+x "$script_name"

  # Print success message
  echo "-- Script '$script_name' created and made executable."
}

