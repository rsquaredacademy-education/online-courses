#!/bin/bash
# Rsquared Academy - 01/Sep/2019
# get started
whoami                                                            # who is the user
date                                                              # get date & time
cal                                                               # display calendar
clear                                                             # clear the screen

# help/documentation
man ls                                                            # help & documentation
whatis ls                                                         # single line description of a command

# navigating file system
pwd                                                               # print working directory
ls                                                                # list files & folders
mkdir R                                                           # create directory

# change working directory
cd R                                                              # navigate into R directory
cd ..                                                             # go up one level
cd -                                                              # go to previous working directory
cd ~                                                              # change directory to home directory
cd /                                                              # change directory to root directory
rmdir R                                                           # remove empty directory

# list files and folders
ls -l                                                             # list files one per line
ls -a                                                             # list all files including hidden files
ls -la                                                            # display permission, ownership, size & modification date
ls -lh                                                            # size displayed in human readable format
ls -lS                                                            # list sorted by size 
ls -ltr                                                           # list sorted by modification date

# file management
touch myanalysis.R                                                # create an empty file/change timestamp
mkdir r_releases                                                  # create new folder r_releases
cp release_names.txt release_names_2.txt                          # copy file in the same directory
cp release_names.txt r_releases/release_names.txt                 # copy file into a different directory
cp -r r R                                                         # copy folder

# move/rename files
mv release_names_2.txt r_releases/release_names_2.txt             # move or rename files or directories
cp release_names.txt release_names_3.txt release_names_4.txt release_names_5.txt release_names_6.txt
mv -f release_names_3.txt r_releases/release_names_2.txt          # do not prompt for confirmation before overwriting files
mv -i release_names_4.txt r_releases/release_names_2.txt          # prompt for confirmation before overwriting files
mv -n release_names_5.txt r_releases/release_names_2.txt          # do not overwrite existing files
mv -v release_names_6.txt r_releases/release_names_2.txt          # move files in verbose mode

# remove/delete files and folders
rm myanalysis.R                                                   # remove file
rm -r myproject1                                                  # recursively remove a directory & all its subdirectories
rm -rf myproject2                                                 # forciby remove directory without prompting for confirmation or showing error messages
rm -i -r myproject3                                               # interactively remove multiple files, with a prompt before every removal
cd myproject4 rm -i                                               # interactively remove multiple files, with a prompt before every removal
cd myfiles rm -v *.txt                                            # remove files in verbose mode, printing a message for each removed file

# compare files and folders
diff imports_olsrr.txt imports_blorr.txt                          # compare files & directories
diff -w imports_olsrr.txt imports_blorr.txt                       # compare file; ignoring whitespaces
diff -y imports_olsrr.txt imports_blorr.txt                       # compare files; showing differences side by side                         
diff -u imports_olsrr.txt imports_blorr.txt                       # compare files; show differences in unified format  
diff -r mypackage myproject                                       # compare directories recursively
diff -rq mypackage myproject                                      # compare directories; show the names of files that differ
       
# browse/search/scroll/output file contents
echo Action of the Toes                                           # print text message
echo -n Action of the Toes                                        # print without trailing newline 
echo Great Truth > release.txt                                    # write message to a file
echo Action of the Toes >> release.txt                            # append message to a file  

# output file contents
cat release_names.txt                                                      # print & concatenate files
cat release_names_18.txt release_names_19.txt > release_names_18_19.txt    # concatenate several files into target file
cat release_names_18_19 >> release_names.txt                               # append several files to target file
cat -n release_names.txt												                           # number all output lines

# output first parts of a file 
head release_names.txt					                                       # output the first parts of a file								
head -n 5 release_names.txt                                            # output the first n lines of a file                         
head -c 30 release_names.txt                                           # output the first c bytes of a file                          
head -n -5 release_names.txt                                           # output everything but the last n lines of a file                          
head -c -3 release_names.txt                                           # output everything but the last c bytes of a file

# output last parts of a file
tail release_names.txt                                                 # display the last part of a file
tail -n num release_names.txt                                          # show the last num lines of a file
tail -n +num release_names.txt                                         # show all file since num line
tail -c num release_names.txt                                          # show last num bytes in a file
tail -f num_releases.txt                                               # keep reading file until Ctrl + C
tail -F num_releases.txt                                               # Keep reading file until Ctrl + C; even if the file is rotated

# browse/search file contents
more lorem-ipsum.txt                                                   # open a file for interactive reading; allowing scrolling & search
less lorem-ipsum.txt                                                   # open a file for interactive reading; allowing scrolling & search

# sort file contents
sort pkg_names.txt                                                     # sort lines of text files
sort -r pkg_names.txt                                                  # sort a file in descending order
sort --ignore-case pkg_names.txt                                       # ignore case
sort -n package_names.txt                                              # use numeric order for sorting
sort -u pkg_names.txt                                                  # preserve only unique lines

# word count
wc release_names.txt                                                   # count words, bytes or lines
wc -l release_names.txt                                                # count lines in a file
wc -w release_names.txt                                                # count words in a file
wc -c release_names.txt                                                # count characters(bytes) in a file

# search & regular expression
grep R package_names.txt                                               # matches patterns in input text
grep -i R package_names.txt                                            # ignore case
grep -i –-color R package_names.txt                                    # highlight matches
grep -i –-color -H bio package_names.txt                               # print file name for each match
grep -i --color -n bio package_names.txt                               # print corresponding line number for each match
grep -i –-color -Hn R package_names.txt                                # print file name & corresponding line number for each match
grep -v R package_names.txt                                            # invert match for excluding specific strings
grep -i –-color -r bio *.txt                                           # recursively search subdirectories

# find files and folders
find -name release_names.txt                                           # find files or directories under the given directory; recursively
find r_releases -name '*.txt'                                          # find files by extension
find -type d -iname r                                                  # find directories matching a given name, in case-insensitive mode: 
find -type d -name r                                                   # find directories matching a given name, in case-sensitive mode: 

# location of executable files
which ls                                                               # locate a program in the user's path
which -a ls                                                            # display multiple executables

# download files from the internet
wget http://cran-logs.rstudio.com/2019/2019-09-11.csv.gz                     # download files from the web 
wget -o latest.csv.gz http://cran-logs.rstudio.com/2019/2019-10-13.csv.gz    # download contents of a url to a file
wget http://cran-logs.rstudio.com/2019/2019-08-11.csv.gz                     # interrupt download using Ctrl + C
wget -c http://cran-logs.rstudio.com/2019/2019-08-11.csv.gz                  # continue incomplete download from the previous command
wget -P downloads -i urls.txt                                                # download all urls stored in a text file to a specific directory
wget http://cran-logs.rstudio.com/2019/2019-10-06.csv.gz --limit-rate=10     # limit download speed (specify k for kb & m for mb; default is bits)
wget http://cran-logs.rstudio.com/2019/2019-08-04.csv.gz --tries=10          # limit number of retries
wget –-quiet http://cran-logs.rstudio.com/2019/2019-09-15.csv.gz             # turn off output
wget –-no-verbose http://cran-logs.rstudio.com/2019/2019-09-08.csv.gz        # print basic information
wget –-progress-dot http://cran-logs.rstudio.com/2019/2019-09-01.csv.gz      # progress bar type
wget –-timestamping http://cran-logs.rstudio.com/2019/2019-09-01.csv.gz      # timestamping
wget –-wait=10 http://cran-logs.rstudio.com/2019/2019-08-18.csv.gz http://cran-logs.rstudio.com/2019/2019-08-18.csv.gz    # wait between retrievals

# transfer data to and from a server
curl https://www.r-project.org/                                                 # download the contents of a url
curl -o sep_20.csv.gz http://cran-logs.rstudio.com/2019/2019-09-20.csv.gz       # download the contents of a url to a file
curl http://cran-logs.rstudio.com/2019/2019-09-21.csv.gz > sep_21.csv.gz        # download the contents of a url to a file
curl -o sep_22.csv.gz http://cran-logs.rstudio.com/2019/2019-09-22.csv.gz -s    # download silently

# sudo
dpkg --list                                           # list installed packages  
sudo apt-get update                                   # update packages
sudo apt-get install zip                              # install zip (we will use it in file compression section)
sudo apt-get remove                                   # remove packages (retain configueations, plugins & settings)
sudo apt-get purge                                    # remove packages including personalized settings
sudo apt-get autoremove                               # remove any dependencies no longer in use

# compress files
tar -tvf release_names.tar                                              # list an archive 
tar -xvf release_names.tar                                              # extract an archive using tar 
tar -rvf release_names.tar release_names_18.txt release_names_19.txt    # add a file to an existing archive
tar -cvf pkg_names.tar pkg_names.txt                                    # create an uncompressed tar archive

# gz
gzip release_names.txt                                # compress a file
gunzip release_names.txt.gz                           # decompress file  
gzip -d sept_15.csv.gz                                # decompress a file
gzip -c release_names.txt > releases.gz               # compress a file and specify the output file name

# zip and unzip
unzip zip_example.zip                                 # extract files
unzip zip_example.zip –d myexamples                   # extract files to given folder
unzip -l main_project.zip                             # list contents 
zip -r myproject.zip myproject                        # compress a directory
zip -r packproj.zip myproject mypackage               # compress multiple directories
zip myproject.zip bash.sh                             # add files to an existing zip file

# system information
uname                                                 # print details about the current machine and the operating system running on it
uname -mp                                             # hardware related information; machine & processor 
uname -srv                                            # software related information; operating system, release number and version 
uname -n                                              # nodename of the system
uname -a                                              # print all available information system

# memory details
free                                                  # display free, used, swap memory in the system

# disk space
df                                                    # overview of file system disk space usage
df -h                                                 # display disk space usage in human readable form 
df myproject                                          # display disk space usage for a specific directory

# command execution duration
time ls                                               # see how long a command takes to execute

# delay/suspend activity
sleep                                                 # suspend/delay activity in seconds
sleep 1m                                              # suspend/delay activity in minutes (stop with Ctrl + C)
sleep 1h                                              # suspend/delay activity in hours (stop with Ctrl + C)

# view/clear command history
history                                               # display commands history with line numbers
history -c                                            # clear commands history

# fun commands
rev "R is awesome"                                    # reverse a line characterwise    
yes "I love R"                                        # output a string repeatedly until killed 

# r in shell
R -e "head(mtcars); tail(mtcars)"                     # launch R and execute 
Rscript -e "head(mtcars)"                             # execute without launching R
Rscript analysis.R                                    # execute R script

# exit the terminal
exit                                                  # exit the terminal
