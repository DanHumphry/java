package com.example.movie.models;

import java.util.List;

public class ToDoItemAdapter {

    public static TodoItemResponse toToDoItemResponse(final ToDoItem toDoItem, final List<String> errors) {
        return TodoItemResponse.builder().toDoItem(toDoItem).errors(errors).build();
    }
}