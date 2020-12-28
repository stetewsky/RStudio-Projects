install.packages("swirl")
packageVersion("swirl")

# https://www.youtube.com/watch?v=7JGnnpIC29c&feature=youtu.be1

library("swirl")
install_course("The R Programming Environment")
swirl()

# NOTES from swirl() tutorial
# cntlr+Shift+C to comment multiple lines
# to find out info regarding an operator type ?`:`  for a function use ?function_name
# concept of vector recycling:
#   -z * 2 + 100, what it really computes is this: z * c(2, 2, 2) + c(100, 100, 100).

# Creating sequences 
#   -e.g. 1:20 has 20;   pi:10 only has 7;  for more control use seq(0,10,by=0.5)
#   -my_seq <- seq(5,10,length=30) gives an unspecified increment with 30 entries;  
#   -seq(along.with = my_seq) is another way to seq_along)
#   -rep(0,times=40) produces a vector with 40 0's
#   -rep(c(0, 1, 2), each = 10)  --> [1] 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2
# Vectors come in two different flavors: atomic vectors and lists
#   -paste(my_char, collapse = " ")
#      The `collapse` argument to the paste() function tells R that when we join together the elements
#      of the my_char character vector, we'd like to separate them with single spaces.
#   -paste() can also be used to join the elements of multiple character vectors.
#      e.g   paste(1:3, c("X", "Y", "Z"), sep="")  --> "1X" "2Y" "3Z"
#   -LETTERS is a predefined variable in R containing a character vector of all 26 letters in the English alphabet
#   -To create a vector z, containing 1000 NAs use   z <- rep(NA, 1000)
#   -To sample n-elements from a vector, use  sample(c(y, z), n)
#   -To test for na entries use is.na() 
#     NA is not really a value, but just a placeholder for a quantity that is not available.
#   -R represents TRUE as the number 1 and FALSE as the number 0
#   -In contrast to NA, NaN if 'not a number'  = 0/0 and Inf-Inf
#   -To select some particular elements (i.e. a 'subset') from a vector is by placing an
#     'index vector' in square brackets immediately following the name of the vector.
#      e.g, to get the first 10 elements of x,  x[1:10]
#   -To get all the NA values and non-NA values in a vector x use  x[is.na(x)] and  x[!is.na(x)]
#   -To get request only values of x that are both non-missing AND greater than zero use x[!is.na(x) & x > 0]
#   -R uses 'one-based indexing', which (you guessed it!) means the first element of a vector is considered element 1
#   - x[c(2, 10)] gives us ONLY the 2nd and 10th elements of x
#   - x[c(-2, -10)] gives us all elements of x EXCEPT for the 2nd and 10 elements  -- shorthand is x[-c(2,10)]
#   - x[0] and x[3000] are meaningess  You should always make sure that what you are asking for is within the bounds of the vector you're working with.
#   -The concept of 'named' elements
#     vect <- c(foo = 11, bar = 2, norf = NA) returns
#       foo  bar norf 
#        11    2   NA    and names(vect) will just return the names
#     or we can add names to vect2 <- c(11, 2, NA) after the fact using 
#      names(vect2) <- c("foo", "bar", "norf")
#     And we can also reference by name  e.g. vect["bar"] or
# Matrices can only contain a single class of data, while data frames can consist of many different classes of data
#   - my_vector <- 1:20 has a lenght() value but no dim() value
#   - dim() function allows you to get OR set the `dim` attribute for an R object
#   - dim(my_vector) <- c(4, 5) -- the numbers 1-20 are put into a 4 x 5 matrix
#   - you can also access this information via the attributes() function on my_vector and class(my_vector)
#   - a matrix is simply an atomic vector with a dimension attribute. A more direct method of creating the same matrix uses the matrix() function
#   - Or just do (my_matrix2 <- matrix(data = 1:20, nrow=4, ncol=5)
#   - the cbind() function will 'combine columns'
#        patients <- c("Bill","Gina", "Kelly", "Sean")   cbind(patients,my_matrix)
#   - But R will 'coerce' the numbers to characters,bye() since a matrix holds only 1 data type
#   - Instead, use my_data <- data.frame(patients, my_matrix)
#       data.frame() function allowed us to store our character vector of names right alongside our matrix of numbers    
#   - To add column names, use  colnames(my_data)<-c("patient", "age", "weight", "bp", "rating","test")
# Logic
#   - You can use the `&` operator to evaluate AND across a vector. TRUE & c(TRUE, FALSE, FALSE) -> TRUE FALSE FALSE
#       This is the equivalent statement as c(TRUE, TRUE, TRUE) & c(TRUE, FALSE, FALSE). - an example of recycling
#   - The `&&` version of AND only evaluates the first member of a vector  TRUE && c(TRUE, FALSE, FALSE) -> TRUE
#   - The '|' and '||' operators follow the same convention, so '||' and && are NON-VECTORIZED
#   - Note that all AND operators are evaluated before OR operators
#   - Useful functions:  isTrue(), identical(), xor()=TRUE if it's given FALSE & TRUE or TRUE & FALSE
#          which() function takes a logical vector as an argument and returns the indices of the vector that are TRUE
#          any() function will return TRUE if one or more of the elements in the logical vector is TRUE
#          all() function will return TRUE if every element in the logical vector is TRUE
# Workspace and Files
#  - getwd(), ls() lists all object in local workspace, list.files() or dir() lists all the files
#  - the args() function determines the arguments to any function, but don't include ()
#  - dir.create("testdir") creates a directory in the current working directory called "testdir".
#  - setwd("testdir") sets your working directory to "testdir"
#  - file.create("mytest.R") creates a file in your working directory called "mytest.R"
#  - file.exists("mytest.R") checks to see if "mytest.R" exists in the working directory
#  - file.rename("mytest.R","mytest2.R") renames the FROM file -> TO file
#  - file.copy("mytest2.R","mytest3.R") copies the FROM file -> TO file
#  - file.path("mytest3.R") provides the relative path to the file "mytest3.R"
#  - dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE) create a directory 
#      in the current working directory called "testdir2" and a subdirectory for it called "testdir3"
#  - setwd(old.dir) - it is often helpful to save the settings that you had before you began an analysis and then go back to
#     them at the end.
# R syntaX
#  - A vector can only contain objects of the same class, provided it's not a list represented as a vector
#       y <- c(1.7, "a")   1.7 is implicitly coerced into a string "1.7"
#       explicit conversion is done like this:  as.integer(x), as.character(x), as.logical(x),
#  - If you explicitly want an integer, you need to specify the L suffix
#  - There is a special number -- inf, such that 1/Inf = 0.  Also NaN is "not a number" e.g.0/0
#  - You can also use the vector function to initialize : x <- vector("numeric", length = 10)  has 10 0s
#  - Matrices are vectors with a dimension attribute. The dimension attribute is itself an integer vector of length 2 (number of rows, number of columns)
#     m <- matrix(nrow = 2, ncol = 3)   dim(m) = 2 3  and they are constructed column-wise
#  - Matrices can also be created directly from vectors by adding a dimension attribute.
#       m <- 1:10   dim(m) <- c(2, 5)  
#     or by column bind or row bind:  x <- 1:3  y <- 10:12  cbind(x, y)  rbind(x,y)
#
# Adding additional changes 
#-------------------------------------------------------------------
# You can exit swirl and return to the R prompt (>) at any time by pressing the Esc
# | key. If you are already at the prompt, type bye() to exit and save your progress.
# | When you exit properly, you'll see a short message letting you know you've done so.

# | When you are at the R prompt (>):
# | -- Typing skip() allows you to skip the current question.
# | -- Typing play() lets you experiment with R on your own; 
# | -- swirl will ignore what youdo...
# | -- UNTIL you type nxt() which will regain swirl's attention.
# | -- Typing bye() causes swirl playto exit. Your progress will be saved.
# | -- Typing main() returns you to swirl's main menu.
# | -- Typing info() displays these options again.
