#!/bin/bash

# Define the function to run tests
run_tests() {
    docker-compose run --rm app sh -c "python manage.py test"
}

# Define the function to run linting
run_lint() {
    docker-compose run --rm app sh -c "flake8"
}

# Check for the subcommand
case "$1" in
    "test")
        run_tests
        ;;
    "lint")
        run_lint
        ;;
    *)
        echo "Usage: $0 {test|lint}"
        exit 1
        ;;
esac

