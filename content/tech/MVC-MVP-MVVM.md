---
title: "Notes on MVC, MVP, MVVM"
date: "2023-03-15"
draft: true
---

They are software architectural patterns, aimed to achieve *separation of concerns*. 

In MVVM we seperate business model, UI, and business logic.

## Classic MVC

[According to Tyrgve Reenskaug](https://folk.universitetetioslo.no/trygver/1979/mvc-2/1979-12-MVC.pdf), in a classic Model-View-Controller architecture the three elements will divide

**Model**: Organizes the application data and informs the view about updates in data.

**View**: Is the visual representation of the model and communicate with the model directly (receive updates from them and sends to the database). The view *does not* handle click and keyboard events!

**Controller**: Functions as the interface for the user; it receives the user input (mouse clicks, keyboard typing) and hands it over to the view, which will update the data accordingly.

There's a [couple of variations](https://collindonnell.com/mvc-isnt-mvc) to this original MVC pattern. 

## View 

- The *view* provides the GUI of an application, visualizes data etc.
- It's essentially handling what the user sees on the screen (layout, structure). 
- In an MVVM pattern, the *view* utilizes information coming from the *view model* and can send information to the view model, like user input.
- Note, however, that a view usually doesn't have any *code-behind*. That means, state changes don't trigger changes in the view directly. Instead the view gets bound to the view model, which has the code and logic to deal with different staes. Thus, in .NET a control's `Command` property can be data-bound to an `ICommand` property on the view model, which executes the code.
- Data-binding between view and view model is normally two-way.

## View Model

- The *view model* does the connection between *view* and *model*. On the one hand, it queries data and information from the model and provides it to the view. On the other hand, it can change data via the model, for example, based on user input in the view.
- The view model sends notifactions to the view, when there's state changes.
- It also does data conversion (from model to view), if necessary.
- Usually it has a one-to-many relationship to the models, and a two-way connection with a model.

## Model

- A *model* is concerned with tasks related to managing data, for example querying data from a database, validating data (through typechecking, pattern matching etc.) or saving data to a database. Usually, models utilize *services*, which implement these functionalities like saving data to a database.
- It contains the *Data Access Layer* (DAL).

## presentation, validation and business logic

- Presentation logic is concerned with user interfaces (the presentation of data and information).
- Business logic is concerned with the saving and manipulating data.

## code-behind model

- The executable (business logic) code should be inside the view model, while the view only contains presentation logic.
- In .NET *.aspx files contain the markup and *.aspx.cs files are the code-behind files.
