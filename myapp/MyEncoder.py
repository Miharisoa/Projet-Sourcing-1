import json

class MyEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, MyClass):
            return vars(obj)
        else:
            return json.JSONEncoder.default(self, obj)