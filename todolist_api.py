# RESTful API
from flask import Flask, jsonify, Response, request
import json, urllib
import pymongo

app = Flask(__name__)

MONGO_URI = "mongodb://admin:Cisc5550cc@ds113200.mlab.com:13200/todolist"
client = pymongo.MongoClient(MONGO_URI, connectTimeoutMs=30000)
db = client.get_default_database()
# db = client.get_database["todolist"]
todolist = db.todolist


@app.route('/api/items', methods = ['GET'])  # default method is GET
def get_items():
    items = todolist
    output = []
    for item in items.find():
        output.append({'what_to_do' : item['what_to_do'], 'due_date' : item['due_date'], 'status' : item['status']})

    return Response(json.dumps(output),  mimetype='application/json')
    

@app.route("/api/items", methods=['POST'])
def add_item():
    items = todolist
    items.insert({'what_to_do' : request.json['what_to_do'], 'due_date' : request.json['due_date'], 'status': None})
    return jsonify({"result": True})


@app.route("/api/items/<item>", methods=['DELETE'])
def delete_item(item):
    item = urllib.parse.unquote(item)
    items = todolist
    items.delete_one({'what_to_do' : item})
    return jsonify({"result": True})


@app.route("/api/items/<item>", methods=['PUT'])
def update_item(item):
    # we do not need the body so just ignore it
    item = urllib.parse.unquote(item)
    items = todolist
    items.update_one({'what_to_do' : item}, {'$set': {'status': 'done'}})
    return jsonify({"result": True})

if __name__ == "__main__":
    app.run("0.0.0.0", port=5001)
