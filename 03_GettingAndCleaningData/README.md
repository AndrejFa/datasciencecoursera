Repo Getting and Cleaning data- course project.

===============================================

This repo was created to submit my work on tidying data from a course project.

Repo has two files: codebook.md and run_analysis.R. 

File codebook.md is description of data, variable and tranformations I had done 
to data. 

File run_analysis.R is a code which result is tidy data set export in .txt file.

===============================================

Short look through code:

1. Creating file, import an unzip data and set working directory.
2. Loading packeages for analysis
3. Import all data files into R studio and merging them into object data
4. Chain 1: select all variable with mean and sstandard deviation plus Person and Activity
		mutate activity variable to factor with apropriate labels
5. Function for creating descriptive variable names and saving it as a coloumn names
6. Create tidy data set with average of each variable for each activity and each subject
7. Export data in .txt format
