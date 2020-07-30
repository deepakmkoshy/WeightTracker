# Weight Tracker
This is just a small Weight tracking application developed in Flutter. 

# Log
This is for Deepak's eyes only, not much of a problem if anyone else sees, but just that its going to be written in a coloqial manner.

### 30-07-2020:
This is going to be the first log update. I started this project on July 26th, 2020. I had just completed the converter app 2 days ago. That app was purely based on the Udacity Flutter course, and other than adding the swap functionality everything else was from the Udacity made code. But it was a great learning experience, and I am sure if I had just tried to build an app from scratch, then I would have run into some big problems because of inadequate knowledge in flutter and dart.

After building the final APK for that project, I started researching about some project ideas in flutter, and I came across a Medium article linking to several open source flutter apps, and one of them was a weight tracker app. The app looked really simple, and since I love tracking my weight, I gave it a shot.

This app was made from scratch by myself. The first 2 or 3 days I was just tinkering behind taking inputs from the user and storing it to a list. Managing the list took some time, but it was really worth the time.

Then I thought about adding a chart which will give a quick glance over the past few days. I started out with some google's chart package, but soon I came across fl_chart package. The moment I saw that package website, I knew it was the One. The chart UI was so aesthetically pleasing, just the way I thought in my mind.

So that brings to 29th of July. I looked at the documentation of the fl_chart package and soon the enthusiasm started to reduce. There were so many parameters and properties, and I had no idea on how to use them. Then what I did was just copied one sample graph code and started to edit the parameters. **That worked!**

Soon I was immersed in the various properties and understood many of them were not of any use. After I got a sense of how the graph works, my next task was to use the list made by the user to generate the X and Y co-ordinates in the graph. This took a shit ton of time. But it was really fun debugging the code, putting up lines and lines of temporary code to check every single methods and lists and what not. Finally had the Eureka moment by 30th July( early morning). Got everything figured out and the app was doing exactly what I wanted it to do(For now). Thats the end of log #1, should create a To-Do section on what all to implement next.

Screenshot:
<p align="center">
  <img src="https://raw.githubusercontent.com/deepakmkoshy/WeightTracker/master/screenshots/30-07-2020%2C%20log.png?token=AHK7QYQVCFSPV5QBUMYLF6S7FQ6N6" width="256" hspace="4">
</p>

# ToDo
* When a user adds a weight for the first time, the Y axis weight range should be according to that first weight. Meaning putting a 20 or 30 kg range(+20 and -20) based on that first weight.
* Naming Y axis: **In Kg** or something if possible, not that important.
* Removing the what user inputted widget or just repurpose it to show the list of weight.
* Converting the X-axis title to dates like 30/07, but lots of things to note like what if user updates the weight more than once in a day etc. 
* Connect FireBase to the app and learn how to implement the database in Firebase instead of storing it locally.
* Two tabs for past week graph range and past month graph
