# sign_in_afcs

This flutter front-end project was developed by residents of the project CIn/Sofftex to learn and train concepts as Flutter Modular, Clean Dart and Mobx in a task manager application.

## Backend Repository

https://github.com/jefferson-norberto2/api_tasks

## Updates in API

- In register_routes(self) method add this:

```
self._app.add_url_rule('/remove_task_by_id', 'remove_task_by_id', self.remove_task_by_id, methods=['DELETE'])

self._app.add_url_rule('/edit_task_by_id', 'edit_task_by_id', self.edit_task_by_id, methods=['PUT'])
```

- In get_tasks(self) method change the query to:

```
query = f'''
            SELECT * FROM {TASK_TABLE_NAME}
            WHERE {USER}={id}
            ORDER BY id DESC
        '''
```

- Add this method to remove a specific task:

``` 
def remove_task_by_id(self):
        id = request.headers.get('id')
        id = int(id)  

        database = Database(DATABASE_PATH)

        query = f'''
            DELETE FROM {TASK_TABLE_NAME}
            WHERE id={id}
        '''

        task = database.fetch_all(query)
        
        self.total_tasks -= 1

        self.socketio.emit('update_response', str(self.total_tasks), namespace='/counter')

        if task:
            return {'task': True}
        else:
            return 'Task not found'
```

- Add this method to edit a specific task

```
def edit_task_by_id(self):
        data = request.data
        new_task = self._task.FromString(data) 
        id = int(new_task.id)
        text = new_task.task
        database = Database(DATABASE_PATH)
        
        query = f''' 
            UPDATE {TASK_TABLE_NAME} 
            SET {TASK}='{text}'
            WHERE id={id}
        '''
        
        task_to_edit = database.fetch_all(query)
        
        if task_to_edit:
            return {'task': True}
        else:
            return 'Unable to edit' 
```

## To run this project

1. ```flutter packages pub run build_runner build``` to generate mobx content.
2. ```protoc --dart_out=. <path/to/messages.proto>``` to generate protobuf content e.g. ```./lib/src/.../user.proto``` 
3. Check your sdk version in ```pubspec.yaml```
4. ```flutter run```


