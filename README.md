---
title: "Getting and Cleaning Data Course Project"
output: github_document
---

This repo contains my submission for the Getting and Cleaning Data Course Project.

The R script ```run_analysis.R``` carries out the following operations:

1. Loads all required data sets
2. Adds variable names to resulting data frames
3. Adds column containing the subject information to data frames
4. Renames new column to subjectId
5. Adds column containing the activity information to data frames
6. Renames new column to activity
7. Combines test & train data frames
8. Changes class of activity & subjectId columns to factor
9. Replaces activity factor levels with decriptive names
11. Finds columns that contain measurements of mean & standard deviation
12. Extracts columns that contain measurements of mean & standard deviation
13. Groups dataset by activity & subjectID
14. Calculates mean of each variable for each combination of activity & subjectId
15. Outputs resulting dataset as a text file named ```output.txt```

**Note: working directory needs to set to the ```UCI HAR Dataset``` for the script to run.**