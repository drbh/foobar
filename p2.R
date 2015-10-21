library(qcc)
# Change some color settings
old <- qcc.options()            # save defaults
qcc.options("cex.stats"=1.2)    # change parameters
qcc.options(bg.margin="azure1")
qcc.options(old)                # restore old defaults

# Problem 1
Five_Sigma_Level <- 10 # 5 sigma on both sides
Six_Sigmas <- 6 # always 6
Cp <- Five_Sigma_Level / Six_Sigmas
cat("PROBLEM 1a: ",Cp)

# Problem 2
# load in data
data <- read.csv("/Users/drbh/Desktop/question_two.csv", stringsAsFactors = FALSE)
# summary(data) # QUICK VIEW OF DATA
xbar_chart <- qcc(data, type="xbar.one", std.dev = "SD", plot = FALSE)
# Plot the process chart
process.capability(xbar_chart, spec.limits = c(.05,.1))
right_answer <- sd(data[[1]]) # ANSWER EXCEL
cat("PROBLEM 2a: ",xbar_chart$std.dev,right_answer,xbar_chart$std.dev - right_answer) # Print both values to the console

# Problem 3
USL <- 5.8
LSL <- 5.0
Cp <- 2.0
Ans <- USL - LSL / Cp
cat("PROBLEM 3a: ",Ans)
#((5.8-x)/(3y) = 2 )and ((x-5.0)/(3y) =2)
#5.4 , 1/15?

# Problem 4
# STD IS NOT ESTIMATED 
# STD.SAMPLE = MU/SQRT(N)?
data_two <- read.csv("/Users/drbh/Desktop/hw4/HW4DataPCDrives.csv", stringsAsFactors = FALSE)
summary(data_two)
xbar_chart <- qcc(data_two[[2]], type="xbar.one", std.dev = "SD", center = 70)
process.capability(xbar_chart, spec.limits = c(45,90))
