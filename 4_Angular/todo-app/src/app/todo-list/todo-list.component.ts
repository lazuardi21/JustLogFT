import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Task } from '../task.model';

@Component({
  selector: 'app-todo-list',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './todo-list.component.html',
  styleUrls: ['./todo-list.component.css']
})
export class TodoListComponent {
  tasks: Task[] = [];
  newTaskDescription: string = '';
  message: string = '';
  messageVisible: boolean = false;

  ngOnInit(): void {
    this.loadTasks();
  }

  addTask(): void {
    if (this.newTaskDescription.trim()) {
      this.tasks.push({ description: this.newTaskDescription, completed: false });
      this.newTaskDescription = '';
      this.saveTasks();
    }
  }

  deleteTask(index: number): void {
    this.tasks.splice(index, 1);
    this.saveTasks();
  }

  toggleTaskCompletion(task: Task): void {
    task.completed = !task.completed;
    this.saveTasks();

    if (task.completed) {
      this.showMessage(`The Task "${task.description}" was completed`);
    }
  }

  showMessage(message: string): void {
    this.message = message;
    this.messageVisible = true;
    setTimeout(() => {
      this.messageVisible = false; // Hide message after 2 seconds
    }, 2000);
  }

  loadTasks(): void {
    const tasks = localStorage.getItem('tasks');
    if (tasks) {
      this.tasks = JSON.parse(tasks);
    }
  }

  saveTasks(): void {
    localStorage.setItem('tasks', JSON.stringify(this.tasks));
  }
}
