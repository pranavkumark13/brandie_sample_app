# brandie_sample

This is a sample app as an assignment from the company Brandie.

In order to run the app, fork this repository.
Run the command "flutter pub get" to fetch the dependencies for the app.
After running flutter pub get, run "flutter run" to run the app.

Assumptions:

1. Showing posts like social media. Currently I am showing 10 posts where in each post it contains 3 images which can be viewed like reels.
2. Handled cases where a social media post can be created without selecting a song, without a caption, without user profile picture. In case caption/audio details are null, we wont show the details. And in case user profile picture is null, we are showing a thumbnail image.
