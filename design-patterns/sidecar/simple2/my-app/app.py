from flask import Flask, jsonify
import json
import os

app = Flask(__name__)

@app.route("/")
def index():
    config_file = os.getenv("APP_CONFIG_FILE", "/app/config/config.json")
    try:
        with open(config_file, "r") as f:
            config = json.load(f)
        return jsonify({"status": "success", "config": config})
    except FileNotFoundError:
        return jsonify({"status": "error", "message": "Config file not found"}), 404
    except json.JSONDecodeError:
        return jsonify({"status": "error", "message": "Invalid config format"}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
