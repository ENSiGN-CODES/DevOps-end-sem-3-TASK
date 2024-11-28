#!/bin/bash

# Define the service you want to manage
SERVICE=$1

# Check if service name is provided
if [ -z "$SERVICE" ]; then
    echo "Usage: $0 <service_name> {start|stop|restart|status}"
    exit 1
fi

# Function to start the service
start_service() {
    echo "Starting $SERVICE service..."
    sudo systemctl start "$SERVICE"
    if [ $? -eq 0 ]; then
        echo "$SERVICE started successfully."
    else
        echo "Failed to start $SERVICE."
    fi
}

# Function to stop the service
stop_service() {
    echo "Stopping $SERVICE service..."
    sudo systemctl stop "$SERVICE"
    if [ $? -eq 0 ]; then
        echo "$SERVICE stopped successfully."
    else
        echo "Failed to stop $SERVICE."
    fi
}

# Function to restart the service
restart_service() {
    echo "Restarting $SERVICE service..."
    sudo systemctl restart "$SERVICE"
    if [ $? -eq 0 ]; then
        echo "$SERVICE restarted successfully."
    else
        echo "Failed to restart $SERVICE."
    fi
}

# Function to check the status of the service
status_service() {
    echo "Checking status of $SERVICE service..."
    sudo systemctl status "$SERVICE" --no-pager
}

# Main logic to check the argument for action
case $2 in
    start)
        start_service
        ;;
    stop)
        stop_service
        ;;
    restart)
        restart_service
        ;;
    status)
        status_service
        ;;
    *)
        echo "Invalid option. Usage: $0 <service_name> {start|stop|restart|status}"
        exit 1
        ;;
esac
