# ERICA_ReminderApp

ERICA_ReminderApp is a part of projects for open source software class in Erica campus of Hanyang University.
>
> - Student Number : 2015048722
> - Major : Department of Information Sociology (정보사회학과)
> - Name : Jaehoon Kim (김재훈)

## Main Screen
<img width="361" alt="1" src="https://user-images.githubusercontent.com/43606451/71322669-a322f080-250d-11ea-869c-3812c46f6867.png">

## What is ReminderApp?
> This application use Flutter with dart with Google Open source Application development cross platform.
Usually we often forget things to do. Unfortunately, human memory is not very good, especially when there is a lot to do.
The more Things you have to do in your brain, the more stressed you are and the less productive you are. 
Do you want to solve this problem? Then you have to use an app to organize your work, yeah, Just like this app.

## Requirements
> OS : Ubuntu Desktop Linux 18.04 LTS

> Xcode - develop for iOS and macOS (at least xcode 11.0)

> Android Studio (at least version 3.5)
>> To test this app, you must use Android Studio

> Flutter (at least v1.9.1)

> IOS Simulator(in xcode) or Android Device for test 

## Install
1. you have to download latest version Flutter SDK :

    $ git clone -b stable https://github.com/flutter/flutter.git
    
2. add path about flutter tool

    $ export PATH=$PATH:`pwd`/flutter/bin
    
> if you don't want to add this path every time, write in '$HOME/.bash_profile'
> to complete this process, you can following code.

    $ vim .bash_profile
> then open in bash_profile(if you are using zsh, in .zshrc), write following code.

    $ export PATH=$PATH:flutter/bin
> finally, write in terminal

    $ source $HOME/ .bash_profile (or .zshrc)
    
3. write in terminal to update flutter

    $ flutter upgrade

4. use flutter doctor to solve some latent problem

> Maybe you have to install git and curl, next step

    $ sudo apt install git curl
    $ flutter doctor

5. open this project in Android Studio, then install Dart SDK

>You have to use following link

    https://dart.dev/get-dart

6. open main.dart file in this project, and live out Simulator tool or connect your device on PC(you should get developer authority in your android device,)

>You Also have to click 'get dependency' button in Android Studio, when you open 'main.dart' file.
    
7. Click run this App in main.dart.    

## Application features
><img width="360" alt="image" src="https://user-images.githubusercontent.com/43606451/71322745-44aa4200-250e-11ea-9920-4d1d1268379a.png">

>You can use the '+' button in the lower right corner to go to the 'Add To Do Things page'.

><img width="358" alt="3" src="https://user-images.githubusercontent.com/43606451/71322671-a3bb8700-250d-11ea-82e7-8b7685a0b4e3.png">

>As shown in the photo, 'Open Source Software Homework' has been added. you can also see the 'Task Added' notification showed at the top in screen.

><img width="360" alt="4" src="https://user-images.githubusercontent.com/43606451/71322672-a3bb8700-250d-11ea-8eb7-c5593658ea2b.png">

>I've added more things.

><img width="360" alt="5" src="https://user-images.githubusercontent.com/43606451/71322673-a3bb8700-250d-11ea-8537-fff9b5b887a6.png">

>If you click 'to do things' on the list, the following window will appear. You can use the 'Cancel' or 'Complete' button to delete the to do in list or to dismiss the decision window.

><img width="357" alt="6" src="https://user-images.githubusercontent.com/43606451/71322674-a4541d80-250d-11ea-96e9-f9ebbacbd044.png">

>If you click the 'Complete' button, this to do is deleted from the list, and the 'Task Completed' notification appears at the top.

><img width="359" alt="8" src="https://user-images.githubusercontent.com/43606451/71322676-a4541d80-250d-11ea-8062-b3282d142b1b.png">

>You can constantly add to do things. To do list is implemented as ListView function, so you can scroll it.

><img width="355" alt="10" src="https://user-images.githubusercontent.com/43606451/71322678-a4ecb400-250d-11ea-8b91-e0afea494829.png">

>By pressing the 'A Trash button' at the top of the screen, you can delete all your tasks just one click. You will also see a notification at the top of the screen indicating that it has been deleted.


## LICENSE