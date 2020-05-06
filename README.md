# water_plant

An app that will help you keep your plants watered!

You need to have Android Studio, as well as the Dart and Flutter plugins installed to run this application on your machine.

See https://flutter.dev/docs/get-started/install for how to install these.



## Overview Screen
Here you can see an overview of your tanks, each presented in a modern, compact way. Each tank card displays the tanks' water level, and the connected plants that need watering. 

[comment]: # (Overview picture.)

### Adding a new device
A new device can be added by pressing the add device button in the top right corner. Here you can choose the name of the device, as well as the internet it should be connected to.

[comment]: # (Gif - showing a tank being added.)

### Editing a device
Clicking on a tank card will show a new screen with further information about the tank and the plants belonging to it. There is also an option to edit the tank, here you can edit the device name, edit which internet the device is connected to, or delete the device altogether.

[comment]: # (Tank overview - go into edit and change the name and internet and then save. Then delete the tank.)

### Adding a new plant
Adding a new plant to a tank is easy, just press the add button located under the tank water status. When adding a new plant, one can choose its name, which pipe from the device it's connected to, and which type of plant it is.

[comment]: # (Gif - showing how to add a new plant.)

### Editing a plant
In the top right corner there is an edit button, similar to the edit button for the tank, which one can use to edit the plant name, the pipe its connected to, the type of plant it is, and its picture. Here you can also remove it from the tank by deleting it.

[comment]: # (Gif of going into edit plant. Change name, show tank pipes available, show plant types and save. Then delete the plant from the tank.)

### Plant actions
Clicking on one of the plants connected to the tank will go to a new screen that shows information about the plant, such as its name, picture, current soil moisture, the device it's connected to, the tanks' current water level, and a checkbox that can turn on and off automatic watering for the plant. There is also a button that the user can press to tell the device to water the plant, or stop the device from watering the plant if it's already watering it.

[comment]: # (Gif - showing plant actions page. Show watering of the plant and use checkbox.)

The plants that have low or critical soil moisture can be watered from the overview screen in one button press. Undoing it is one button press away too.

[comment]: # (Gif - showing plants being watered from overview screen, and undo)

In the plant screen, there is an information button that one can press, which will show a page that contains information about the plant type, somewhat similar to a condensed Wikipedia lookup of that plant type. Here one can see information such as the ideal soil moisture, placement and watering habit for that type of plant, as well as a picture of that type of plant.

[comment]: # (Gif - going from plant actions screen to plant information.)

## All Plants
Here is a list of all the plant(s) that you have connected to your device(s). The plants that are the most in need of watering are displayed closest to the top for easy access.

[comment]: # (Show gif of scrolling through all the plants. Click on one of the plants to show where it goes.)

## Plant information
Here one can search through a database of plants to find information about them, similar to a small, condensed Wikipedia page.

[comment]: # (Show gif using the search function.)

## Settings

### Account
In the settings we have an Account section, where the user can fill in or change information about them, like their name, email and phone number.

[comment]: # (Gif - going into Account and filling out the fields there.)

![alt-text](https://github.com/nip009/water_plant/blob/dev/assets/gifs/settings/account.gif)

### Notifications
There is also a Notifications section, where the user can choose which notifications he or she wants to receive, and how often to receive them.

[comment]: # (Gif - going into notifications, using some of the switches there etc.)

![alt-text](https://github.com/nip009/water_plant/blob/dev/assets/gifs/settings/notifications.gif)

### About
Lastly, there is an about page which displays the logo of the app and which version it is.

[comment]: # (Gif - going into About.)

 ![alt-text](https://github.com/nip009/water_plant/blob/dev/assets/gifs/settings/about.gif)