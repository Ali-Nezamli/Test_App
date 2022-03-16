# testapp

Project Structure:
1.	Data
  a.	Services 
  b.	Repositroy
2.	Screens
  a.	Auth- SignIn
  b.	Bloc
  c.	Home
3.Theme
created SignIn UI.
State Management used : Bloc.
For API integrate I used HTTP  Protocol.

I used Test Sign in API  and connected to the backend server by using the http post request.
I Managed the state of the app using BLOC state management.
Created SignIn Event and three states for that event when connecting to API and managed the process using the BlocConsumer.

Google SignIn implement using firebase , created new project and added new app using package name and downloaded google services and added it to the app.
To use google sign in we need to create SHA1 hash key for debug ,and add it to the project settings in firebase console.

to use signIn you can use this information :
email : a@gmail.com
password : 12345678
