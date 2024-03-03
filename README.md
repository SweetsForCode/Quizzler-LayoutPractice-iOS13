![Owl Develop Banner](OwlDevelopBanner.png)

#  Quizzler

## My Goal

My goal from this tutorial was to give me a refresher on structs and how they are used in Swift & iOS development. 

## What I created

Through this tutorial I created a trivia app, that allows a user to answer 7 true or false questions. I ended up getting carried away, and went a bit futher than what the tutorial provided. Instead of 100% following the tutorial I made the following changes: 

* Instead of simply changing the background color when a user selects T/F I changed the sprite & button text color entirely. Thank you Photoshop!
* The app now has a "Restarting..." delay at the end of the quiz to give the user a bit of a _refreshing_ feeling. A simple but effective method of using gamification to allow a user to stay hooked onto a game.
* Rather than using structs (like the tutorial intended) I opted to just use a 2D array, simply because I was hyper focused on smaller UI/UX details (I was also stuck on the autolayout for about half an hour, if I'm being 100% honest). 

## What I learned

* How to programmatically hide UI elements on iOS
* How to programmatically change sprites (images, background images, etc.)
* How to use UIColor effectively, and through shorthand (UIColor.red vs .red)



## Default Quiz

```
    let questions:[String:Bool] = ["Luke turned to the dark side. ": false,
                                   "Batman is Bruce Wayne": true,
                                   "The Flash is fast": true,
                                   "Kyber Crystals don't power a lightsaber": false,
                                   "The Avatar has to master 3 elements": false,
                                   "Majora destroyed termina in 3 days": true,
                                   "Zelda is the boy in green.": false]
```

## Multiple Choice Quiz

```
 Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
```        


>This is a companion project to The App Brewery's Complete App Development Bootcamp, check out the full course at [www.appbrewery.co](https://www.appbrewery.co/)

>This repository was provided by the App Brewery with modifications from _Owl Develop_
