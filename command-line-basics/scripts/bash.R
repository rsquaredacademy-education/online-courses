# execute command without options
system2(command = "pwdls")

# execute command with options
system2(command = "ls",
        args    = c("-l"))

# redirect output to file
system2(command = "echo", 
        args    = c("Great Truth"), 
        stdout  = "release.txt")

# redirect output to R console
system2(command = "diff", 
        args    = c("imports_olsrr.txt", "imports_blorr.txt"),  
        stdout  = TRUE)