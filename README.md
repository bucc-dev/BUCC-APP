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
  - Always declare return types in your methods.
  - Put required named parameters first.
  - Always require non-null named parameters (@required).
  - Indent your code where appropriate.
  - Use two-space indentation.
  - Use arrow notation where the return statement takes a single line. No braces here.
  - If the return statement takes multiple lines, use braces.
  - Avoid unnecessary use of "this", except where the object may be shadowing another object.
  - Don't use braces in string interpolation except where necessary.
  - All variables and imports upon declaration, must either be used or removed.
  - Always specify type annotations.
  - Views should never MAKE USE of a service directly.
  - Views should contain zero to (preferred) no logic. If the logic is from UI only items then we do the least amount of required logic and pass the rest to the ViewModel.
  - Views should ONLY render the state in its ViewModel.
  - 1 View has 1 ViewModel
  - ViewModels may be re-used if the UI requires the exact same functionality.


  ## Architecture:
  
  MVVM suggested. Why? 
  - Modularity - ability to separate different sections of the app into small sections or modules, allowing for separate UI and logic code.
  - Scalability - maintenance and upgrade friendly.
  - Testability - different parts of the code can be independently tested.
  - Popularity - MVVM is a popular architecture among devs, thus most devs don’t need to spend additional time to learn a new concept.
  - Ability to integrate repository pattern - to interface between the api and the local database.
  Views on top, the closest to the user, ViewModels are below that taking input from the Views and Services below that which is what the ViewModel's make use of to provide functionality. View's take in the users input and shows them things. The view then goes to the ViewModel and says, "Could you please do this thing for the user". The ViewModel then goes to the service and says "Can you please do this thing for me and let me know when you're done". The service then does the actual thing and then returns the results to the user.
    
  ## State Management
    Provider suggested, flows well with the MVVM architecture.

  ## Local Storage
    SharedPreferences - since the data to be stored are simple and small
    Hive - For easy retrival of data when application is offline

  ## Testing
  Ensure all widgets and functionalities are tested before pushing to the repository.

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
  - utilities: this dir contains subdirectories for utility classes, functions, mixins and even extension classes.
    - constants: houses constant values like the base API url.
    - extensions: houses dart extension methods
    - mixins: houses mixin dart files 
  - view_models: this directory houses the all view model files. A viewmodel class to a screen (as viewmodels are used to house the data of a specific UI - separating UI code from logic code). The UI/Screen interacts with the viewmodel to communicate with the services and other required functionalities to update the UI/View.
  - Model
  - Services: This directory houses classes created to perform a service for your user. That service can be to open the camera, share information, create a post, keep track of posts, cache your results, etc. Basically anything that has to DO something will be a service class.
  - views: this directory houses the UI dart files. A subdirectory is created for each screen where everything related to the screens are saved.
    - custom_widget: this is a subdirectory in the view directory for housing custom widgets that would require alot of codes. In this case, a subdirectory is needed to separate the main view dart file from the widgets classes extracted from it.
    - general_widgets: this is a subdirectory in the view directory for housing reusable widgets (e.g snackbars, popups e.t.c.) that would be used by different widgets/screens.
  - main.dart: The main.dart file houses the main method which serves as the entry or starting point for Dart code execution. It is invoked on app launch.

  ### Resources
  - [Unit test](https://www.filledstacks.com/post/practical-guide-to-unit-testing-in-flutter/)
  - [Unit test](https://www.filledstacks.com/post/how-to-unit-test-in-flutter/)
  - [How To Mock Unit Testing](https://www.filledstacks.com/post/how-to-mock-for-unit-testing/)
  - [Service class/folder](https://www.filledstacks.com/post/services-in-code-and-how-to-use-them-in-flutter/)
  - [Dynamic Link](https://www.filledstacks.com/post/dynamic-links-in-flutter-a-complete-guide/)
  - [Responsive UI](https://www.filledstacks.com/post/the-best-flutter-responsive-ui-pattern/)
  - [Responsive UI](https://www.filledstacks.com/post/building-a-responsive-ui-architecture-in-flutter/)
  - [Flutter streams](https://www.filledstacks.com/post/a-complete-guide-to-flutter-streams/)
  - [Flutter test](https://docs.flutter.dev/cookbook/testing/widget/introduction)
  - [Flutter test](https://www.youtube.com/watch?v=RDY6UYh-nyg)
  - [Flutter test](https://www.youtube.com/watch?v=eLMa2jgp_bw&list=PLUiueC0kTFqLvpFk_Zg55geh_TBTKnbnA)
  - [Flutter test](https://www.youtube.com/watch?v=9wNa48EiksM&list=PL6tu16kXT9PrzZbUTUscEYOHHTVEKPLha)
