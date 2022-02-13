# BUCC_APP
    ## Overview
  This is the **BUCC_APP** Mobile app project repository handled by **BUCC MOBLIE DEV TEAM**, written with pure [Flutter](https://flutter.dev/).    

  - _All team members must adhere to the following instructions while working on this project._
  - _Make sure you understand the project architecture before proceeding with any task._

  ## Project Description
    BUCC companion mobile application that makes information on topics available to students at any time. This system will provide a platform for students to receive updates on timetables, events, notifications on newsletters and connect with other students and professionals. With the BUCC companion app, students can get access to information about their courses, timetable, events and as such get access to answers from other students. They can also connect to other students in other learning environments and compare curriculums and ideas, as well as collaborate on projects all to expand their horizons mentally. The BUCC companion app enables students to share content and manage communication with students and colleagues.

  ## Design
   The figma design that will be implemented for this project can be found [here](https://www.figma.com/file/UkMy71OalhulUrNURfrDlK/BUCC?node-id=0%3A1)

  ## Code Style
  **i. Naming Convention:**

|Naming Convention|Effective Style|Example|   
|-----------------|---------------|-------|
|Classes, enum types,typedefs,and type parameters,etensions|PascalCase|An example is HomeScreen|
|Libraries, packages, directories, and source files, import prefixes|snake_case|An example is home_screen|
|Class members, top-level definitions, variables, parameters, and named parameters, constants|camelCase|An example is verifiedUser|

  ## Style Rules
    Always declare return types in your methods.
    Put required named parameters first.
    Always require non-null named parameters (@required).
    Indent your code where appropriate.
    Use two-space indentation.
    Use arrow notation where the return statement takes a single line. No braces here.
    If the return statement takes multiple lines, use braces.
    Avoid unnecessary use of "this", except where the object may be shadowing another object.
    Don't use braces in string interpolation except where necessary.
    All variables and imports upon declaration, must either be used or removed.
    Always specify type annotations.


  ## Architecture:
    MVVM suggested. Why? 
      Modularity - ability to separate different sections of the app into small sections or modules, allowing for separate UI and logic code.
      Scalability - maintenance and upgrade friendly.
      Testability - different parts of the code can be independently tested.
      Popularity - MVVM is a popular architecture among devs, thus most devs don’t need to spend additional time to learn a new concept.
      Ability to integrate repository pattern - to interface between the api and the local database.
    
  ## State Management
    Provider suggested, flows well with the MVVM arch

  ## Local Storage
    SharedPreferences - since the data to be stored are simple and small
    Hive - For easy retrival of data when application is offline

  ## Testing
  Ensure

## Contribution Guide
  **_Steps to collaborate on the repository for team members._**
  ### Forking and Cloning Repo
  * Fork the project.  
  * Click on the "Code" button on the Repo page.
  * Copy the URL for the forked Repo "https://github.com/your-github-username/BUCC-APP.git"
  * Open your Code Editor and  run `git clone` "https://github.com/your-github-username/BUCC-APP.git"
  
  ### _Add "Remote To" and "Pull From" Upstream_
  * Add a Remote to Upstream to your Repo:
      Using the command : `git remote add upstream` ` "https://github.com/bucc-dev/BUCC-APP.git" ` 
  * Pull from upstream to download all changes in the project using `git pull upstream develop`

  ### _Create and Commit Changes to a New Branch_
  When your task is completed:
  * Create a new branch with your task name e.g "feat- UserSignUP". 
  * run: `git checkout -b feat/yourTask`
  **Push to github;**
  * `git add .`
  * `git commit -m "feat: Inplemented yourTask"`
  
  ### Push New Branch to "Origin" Repository
  * To make sure there are no conflict, Pull from upstream using `git pull upstream develop`
  * Push your branch changes to the Repo using `git push origin "feat/yourTask"` note how it end with a branch.

  ### Creating Pull Request
  **When making a PR, your PR is expected to have the following comments"**
  * What is the task/issue completed?
  * What does the PR actually do?
  * How can the PR be manually tested?
  * Screenshots(of your implementation - A mobile screen or an APi payload). 


  ### Directory stucture
    components: this directory contains the list of widgets classes that can be reused in the different parts of the application.
    utilities: this dir contains subdirectories for utility classes, functions, mixins and even extension classes
constants: houses constant values like the base API url
extensions: houses dart extension methods
        mixins: houses mixin dart files 
    view_models: this directory houses the all view model files. A viewmodel class to a screen (as viewmodels are used to house the data of a specific UI - separating UI code from logic code). The UI/Screen interacts with the viewmodel to communicate with the services and other required functionalities to update the UI/View.
    views: this directory houses the UI dart files. A subdirectory is created for each screen where everything related to the screens are saved.
        component: this is a subdirectory in the view directory for housing custom widgets that would require alot of codes. In this case, a subdirectory is needed to separate the main view dart file from the widgets classes extracted from it.
        general_widgets: this is a subdirectory in the view directory for housing reusable widgets (e.g snackbars, popups e.t.c.) that would be used by different widgets/screens.
    main.dart: The main.dart file houses the main method which serves as the entry or starting point for Dart code execution. It is invoked on app launch.

