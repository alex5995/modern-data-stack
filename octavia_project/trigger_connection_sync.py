import os
import sys
from pathlib import Path

import requests
import yaml
import time

CONNECTIONS_PATH = Path(__file__).parent / "connections"
AIRBYTE_HOST = os.getenv("AIRBYTE_HOST", "http://localhost:8000")
AIRBYTE_USERNAME = os.getenv("AIRBYTE_USERNAME", "airbyte")
AIRBYTE_PASSWORD = os.getenv("AIRBYTE_PASSWORD", "password")

if __name__ == "__main__":
    connection_name = sys.argv[1]

    last_timestamp = 0
    connection_id = ""

    for state_yaml_path in (CONNECTIONS_PATH / connection_name).glob("state_*"):
        with open(state_yaml_path) as f:
            state_info = yaml.safe_load(f)

        if state_info["generation_timestamp"] > last_timestamp:
            last_timestamp = state_info["generation_timestamp"]
            connection_id = state_info["resource_id"]

    assert connection_id, "state yaml not found"

    r = requests.post(
        f"{AIRBYTE_HOST}/api/v1/connections/sync",
        auth=(AIRBYTE_USERNAME, AIRBYTE_PASSWORD),
        json={"connectionId": connection_id},
    )
    assert r.status_code == 200, "connection sync trigger failed"
    job_id = r.json()["job"]["id"]
    
    while True:
        time.sleep(60)
        r = requests.post(f"{AIRBYTE_HOST}/api/v1/jobs/get",  auth=(AIRBYTE_USERNAME, AIRBYTE_PASSWORD), json={"id": job_id})
        assert r.status_code == 200, "job status fetch failed"
        job_status = r.json()["job"]["status"]
        if job_status == "succeeded":
            break
        if job_status == "running":
            continue
        sys.exit("connection sync job failed")
