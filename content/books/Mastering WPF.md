---
title: "Mastering Windows Presentation Foundation by Sheridan Yuen (2020)"
date: "2023-03-15"
draft: true
---

- XAML markup, data binding classes, and `ICommand` and `INotifyPropertyChanged` interfaces are the main tools in WPF.

instead of using a `Click` event, it's typical in WPF to use implement the `ICommand` interface. The `ICommand` interface is in the view model, while the `Command` property is in the view.

A very simple boilerplate for an event handler would look like this:

```csharp
using System;
using System.Windows.Forms;
using System.Windows.Input;

public class TestCommand : ICommand 
{
    public event EventHandler CanExecuteChanged;
    public void Execute(object parameter)
    {
        MessageBox.Show("A command was executed");
    } 
    public bool CanExecute(object parameter)
    {
        return true;
    }
}
```

`INotifyPropertyChanged` interface in view model + `PropertyChanged` property in view

"[W]e should avoid putting any business logic into the code behind files of our Views."
Views' cde-behind files can however have UI-related code in them.

Data binding between View and View Model is donne via the View's `DataContext` property.

In WPF and MVVM button clicks are handled by a command that implements the `ICommand` interface. The `ICommand` interface one event and two methods:
```csharp
event EventHandler CanExecuteChanged;   
// ...is invoked when changes occur that can change whether or not the command can be executed
bool CanExecute(object parameter);  
// ...will determine whether the command can be executed or not
void Execute(object parameter);  
// ...runs the command logic
```

