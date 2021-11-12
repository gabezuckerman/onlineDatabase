# onlineDatabase

Download by clicking the green `Code` button on the top right of the screen, using the `Download Zip` option.  Unzip the contents.  To read the guide on uploading data, open the `addingDataGuide.html` in your browser.  Waiting to write the actual adding functionality until we discuss some key points.

For now to download data, open the GYElk (can change name once we add other data) folder, open `app.R`, install any necessary packages, and then click run app*. Username: g, Password: test. 

*The app runs, but only has front-end capabilities now.  It is just there to give you an idea of what it could look like. Eventually this app will run online.



Discussion topics:

1.) Storage of data.  Current thought is to use google drive (though I know Berkeley's storage quotas are changing soon) with a Special Purpose Account (SPA) to allow for more storage and password protection. Also, it seems pretty easy to for R to communicate with google drive.

2.) Cleanliness of data in the database.  One for raw and one for clean? Or just raw, and create a folder for cleaned data that is a single .csv file?

3.) How to preserve raw data when adding to the database. ie don't want to overwrite raw database mistakenly--could have a delayed overwrite that only updates the raw database after your satisfied with updating a copy?  Will explain more.

4.) Does the idea of a shiny app to download data sound good?  Somewhat easy to implement: choose species, if elk which herd and timeline, if puma, which site(?) and timeline

Please think of other topics it might be pertinent to discuss as well as potential solutions to the above topics.
