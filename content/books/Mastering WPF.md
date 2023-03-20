---
title: "Mastering Windows Presentation Foundation by Sheridan Yuen (2020)"
date: "2023-03-15"
draft: true
---

- XAML markup, data binding classes, and `ICommand` and `INotifyPropertyChanged` interfaces are the main tools in WPF.

`ICommand` interface in view model + `Command` property in view
`INotifyPropertyChanged` interface in view model + `PropertyChanged` property in view

"[W]e should avoid putting any business logic into the code behind files of our Views."
Views' cde-behind files can however have UI-related code in them. 

Data binding between View and View Model is donne via the View's `DataContext` property.

In WPF and MVVM button clicks are handled by a command that implements the `ICommand` interface.

`internal` visibility in C# is used for classes or functions that should only be accessible within the same .exe or .dll (i.e. the same *assembly*).